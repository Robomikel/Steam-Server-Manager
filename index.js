const Discord = require('discord.js');
const fetch = require('node-fetch');
const config = require("./config.json");



const client = new Discord.Client();
const prefix = '!';

const trim = (str, max) => str.length > max ? `${str.slice(0, max - 3)}...` : str;

client.once('ready', () => {
    console.log('Ready!');
});

client.on('message', async message => {
    if (!message.content.startsWith(prefix) || message.author.bot) return;

    const args = message.content.slice(prefix.length).trim().split(/ +/);
    const command = args.shift().toLowerCase();

    if (args[1] == config.server.serverfile) {
        var servername = config.server.serverfile;
        var port = config.server.webport;
    } else if (args[1] == config.server2.serverfile) {
        var servername = config.server2.serverfile;
        var port = config.server2.webport;
    }
    console.log(servername, port);

    if (command == 'ssm') {
        console.log(`command SSM`)
        if (args[0] == 'start') {
            console.log(`command start`)
            console.log(servername, port)
            if (args[1] == servername) {
                const https = require('http')
                const options = {
                    hostname: 'localhost',
                    port: port,
                    path: '/monitor',
                    method: 'GET'
                }
                message.reply(`starting server...`);
                const req = https.request(options, res => {
                    console.log(`statusCode: ${res.statusCode}`)
                    res.on('data', d => {
                        const obj = JSON.parse(d);
                        console.log(obj.status);
                        //process.stdout.write(obj.ServerStatus);
                        if (obj.status) {
                            message.reply(`Started server yay!`);
                        } else {
                            message.reply(`start failed`);
                        }
                    })
                })
                req.on('error', error => {
                    console.error(error)
                })
                req.end()
            }
        } else if (args[0] == 'stop') {
            if (args[1] == servername) {
                const https = require('http')
                const options = {
                    hostname: 'localhost',
                    port: port,
                    path: '/stop',
                    method: 'GET'
                }
                message.reply(`stopping server...`);
                const req = https.request(options, res => {
                    console.log(`statusCode: ${res.statusCode}`)
                    res.on('data', d => {
                        const obj = JSON.parse(d);
                        console.log(obj.status);
                        //process.stdout.write(obj.ServerStatus)
                        if (obj.status == 'stopped') {
                            message.reply(`stopped server yay!`);
                        } else {
                            message.reply(`stop failed`);
                        }
                    })
                })
                req.on('error', error => {
                    console.error(error)
                })
                req.end()
            }
        } else if (args[0] == 'query') {
            if (args[1] == servername) {
                const https = require('http')
                const options = {
                    hostname: 'localhost',
                    port: port,
                    path: '/query',
                    method: 'GET'
                }
                message.reply(`query server...`);
                const req = https.request(options, res => {
                    console.log(`statusCode: ${res.statusCode}`)
                    res.on('data', d => {
                        const obj = JSON.parse(d);
                        console.log(obj.status);
                        //process.stdout.write(obj.ServerStatus)
                        if (obj.status) {
                            // message.reply(obj.status);
                            const m = obj.status
                            const msg = JSON.parse(m);
                            console.log(msg)
                           // message.reply(obj.status);
                           const exampleEmbed = new Discord.MessageEmbed()
                               .setColor('#0099ff')
                               .setTitle('SSM Query')
                               // .setURL('https://discord.js.org/')
                               // .setAuthor('Some name', 'https://i.imgur.com/wSTFkRM.png', 'https://discord.js.org')
                               // .setDescription('Some description here')
                               // .setThumbnail('https://i.imgur.com/wSTFkRM.png')
                               .addFields(
                                   { name: 'Server Name', value: msg.ServerName },
                                   // { name: '\u200B', value: '\u200B' },
                                   { name: 'Ping', value: msg.Ping, inline: true },
                                   { name: 'Players', value: msg.Players, inline: true },
                                //    { name: 'Connect', value: msg.Connect , inline: true },
                               )
                               // .addField('Inline field title', 'Some value here', true)
                               // .setImage('https://i.imgur.com/wSTFkRM.png')
                               .setTimestamp()
                               // .setFooter('Some footer text here', 'https://i.imgur.com/wSTFkRM.png');

                           // channel.send(exampleEmbed);
                           message.reply(exampleEmbed);
                        } else {
                            message.reply(`stop failed`);
                        }
                    })
                })
                req.on('error', error => {
                    console.error(error)
                })
                req.end()
            }
        } else if (args[0] == 'details') {
            if (args[1] == servername) {
                const https = require('http')
                const options = {
                    hostname: 'localhost',
                    port: port,
                    path: '/details',
                    method: 'GET'
                }
                message.reply(`Details server...`);
                // inside a command, event listener, etc.



                const req = https.request(options, res => {
                    console.log(`statusCode: ${res.statusCode}`)
                    res.on('data', d => {
                        const obj = JSON.parse(d);
                        console.log(obj.status);
                        //process.stdout.write(obj.ServerStatus)
                        if (obj.status) {
                             const m = obj.status
                             const msg = JSON.parse(m);
                             console.log(msg)
                            // message.reply(obj.status);
                            const exampleEmbed = new Discord.MessageEmbed()
                                .setColor('#0099ff')
                                .setTitle('SSM Details')
                                // .setURL('https://discord.js.org/')
                                // .setAuthor('Some name', 'https://i.imgur.com/wSTFkRM.png', 'https://discord.js.org')
                                // .setDescription('Some description here')
                                // .setThumbnail('https://i.imgur.com/wSTFkRM.png')
                                .addFields(
                                    { name: 'Server Name', value: msg.ServerName },
                                    // { name: '\u200B', value: '\u200B' },
                                    { name: 'CPU', value: msg.CPU, inline: true },
                                    { name: 'Memory Used', value: msg.MemoryUsed, inline: true },
                                    { name: 'Steam Master', value: msg.Steam_Master , inline: true },
                                )
                                // .addField('Inline field title', 'Some value here', true)
                                // .setImage('https://i.imgur.com/wSTFkRM.png')
                                .setTimestamp()
                                // .setFooter('Some footer text here', 'https://i.imgur.com/wSTFkRM.png');

                            // channel.send(exampleEmbed);
                            message.reply(exampleEmbed);
                        } else {
                            message.reply(`stop failed`);
                        }
                    })
                })
                req.on('error', error => {
                    console.error(error)
                })
                req.end()
            }
        }
    }
});

client.login(config.BOT_TOKEN);
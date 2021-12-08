USE [Vuokraus]
GO
SET IDENTITY_INSERT [dbo].[tuote] ON 

INSERT [dbo].[tuote] ([yksilointikoodi], [tuoteryhma], [nimike], [merkki], [Malli], [paivavuokra]) VALUES (1, N'Sähkötyökalut', N'Akkuporakone', N'Bosch', N'GX120', 8)
INSERT [dbo].[tuote] ([yksilointikoodi], [tuoteryhma], [nimike], [merkki], [Malli], [paivavuokra]) VALUES (2, N'Nostimet', N'Henkilönostin', N'Dino', N'1200', 60)
INSERT [dbo].[tuote] ([yksilointikoodi], [tuoteryhma], [nimike], [merkki], [Malli], [paivavuokra]) VALUES (3, N'Telineet', N'Taso', N'Protools', N'100 x 300', 3)
INSERT [dbo].[tuote] ([yksilointikoodi], [tuoteryhma], [nimike], [merkki], [Malli], [paivavuokra]) VALUES (4, N'Sähkötyökalut', N'Poravasara', N'Kangoo', N'Bx100', 12)
INSERT [dbo].[tuote] ([yksilointikoodi], [tuoteryhma], [nimike], [merkki], [Malli], [paivavuokra]) VALUES (5, N'Sähkötyökalut', N'Akkuporakone', N'Makita', N'DC24-7', 10)
SET IDENTITY_INSERT [dbo].[tuote] OFF
GO

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794978603;
	b=PAz765751yXK2+lstKyNtAolZSz+VTgZySuLf1SBra37sMQjs1wdMBgq1Ug918zNjyeu
	 9p+shBuQ23skhaRN2HtWNfkOgHBdLd5tTgQFV+HDafJesO07SIEums6cesfk6o78ZGlOQ
	 s8YA6J87xp8dw/U+w3aRJKwxMqytN22WCX6RP+pf2G5ngvXXKMxoqTu2kZxIOXK+baCqP
	 m0PbmZIuuKrKHY+uhQ3nuD3UOJh3jufY/WDyjFT+TxphN9vSTVY/hM4LLPG3D+KsCGRje
	 CbCuBzTA9BwJnO6VERHWPVnUphv7vygpmzRrs6IKcBb/SredTpVfd9gNhvU5RhQoYcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978603;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/M6RtPVIRopXzgv+xTQ78HaZu0Jtv+dw3goSqBJJcQI=;
	b=JDFGECaRsW113ZpjLyFuw8RmCNgobIIkxldAFmlq9Cs4gEZVo9RUU0WD01Zda50tsv3k
	 RN43KMeGUO2hgmqEuJlUqAK8ulBq0FGpd0wqQOzaDh3D/hAxmdHpJnWwERdTi3dvm+X0a
	 3ouOinavo9uduuCIJo0noiRZOGsClD+qDpewaVZMiFhl2Q8nEpG1K325T6tpdki7Q4TNT
	 +SwzI6Kx7xg00b74H733qwEFtg+3Jkga0n0KgY1D1EUeebYycx+B9K6QnXXaOixZWK/hv
	 wQrO8ZEM317NKkoAGOMdQD15p2mHfsjLnjgsa2pxuMJiktG73B9o/il7JcNybNgXmZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dieKNGkt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.23
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010023.outbound.protection.outlook.com [52.103.20.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F04B606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F04B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dieKNGkt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUPCiASaDWz2Nrqq0VtEYd6G/t6jDoUDft8YfLrVRiqk7URdZweIlVPE+JRAddpDG8LiF2G9xZn0OahnFCedrhRhOMNzxCWojGWZPw0DfaKIWEw3evoPd6BZd4esuNJM+PCUMpOx7XawLcgK6K3rX61xqWv3q04tfWm8IbDdleae3gZ9+oF+ELL7dLvb/iLzuDlKWO/CdX1sw3UzafYunNlsQhpxCthE+oLn3SseuvPDlWYe9jDIasDzkO/2Uen8eZSn1Wh9klDuuI+jWu//KEsZ6IZMPww9q1Tk6zPjmAdXEkPavveMAqjulKSoEuTgzqiV4LH+8kgo/Vh5gztt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M6RtPVIRopXzgv+xTQ78HaZu0Jtv+dw3goSqBJJcQI=;
 b=rFEWGqdl22wCQ5TlAsn1GemdQxScTMYLooa0umw4PH1C9FZY8qsng+xIEcdY1f9C7PgTTxF4XYE2zV/SNAQOQg5GW8L9kUPtYtpTjSGD7stz4KSqW1AnNjgKIAUgo+XBsBgMBteFU868nM5mU6WDQi5Gqwmn1aMQ1y2/ImkFmc6Ow5aWWDKAj6vBBd0xRdlsx2qLXmZ/gh6ul2O4gaT42TOisMq2b6Jyu7Mwz0oxF3A/GVrKxuHvnwmjryOh4186w+fYdJG3tQ9ZdvJLNSIAltE5cXwvBQ9g12sZg4pBwWu9DDKkMZWoskhlSfoOSHpihZxYxuKe0NcnK1erZRLqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M6RtPVIRopXzgv+xTQ78HaZu0Jtv+dw3goSqBJJcQI=;
 b=dieKNGkteemXxyomBCzsBUwAnUBA1VVzlHTgxrHpQPZMa4Sy3p2bjGgmH2LyCKgNTBFK0z0fjDn2H9wZUD6BCFkrQqO41ia3tUlcpMnDtHnj5wtEBay4ek+DLqnmxKHDooi12pRA37N9qFwwwR78liDShiDyWcFQZ2Ef/j4sRNvPYRq3WrESBl++h8Z9TbbE4XpGDqp8SzBThsLbn6BRx18/0kVWXSCABzp/PKxbfPoSAJ3N6sj/0VlwL3iZ9j5Oqt6Ul0VZdgAUwMwumfDq3jnUQTeeylvsgeOncuPlM30LC0c/p0RObN7wLk0K3UvqYPVD7ljxEKD2p7xl2enQUg==
Received: from PH7PR19MB6658.namprd19.prod.outlook.com (2603:10b6:510:1ac::6)
 by PH0PR19MB5177.namprd19.prod.outlook.com (2603:10b6:510:78::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 05:10:00 +0000
Received: from PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32]) by PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 05:10:00 +0000
From: desobei <desobei@outlook.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	desobei <desobei@outlook.com>
Subject: [PATCH] comedi: ni_routing: fix SyntaxWarning in convert_csv_to_c.py
Date: Wed, 18 Nov 2026 00:09:49 -0500
Message-ID:
 <PH7PR19MB66587C2BE5E8E94F693B4F14AF7A2@PH7PR19MB6658.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0341.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::27) To PH7PR19MB6658.namprd19.prod.outlook.com
 (2603:10b6:510:1ac::6)
X-Microsoft-Original-Message-ID: <20261118050949.6612-1-desobei@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR19MB6658:EE_|PH0PR19MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5d1ddc-8956-416e-7c94-08df453231b3
X-MS-Exchange-SLBlob-MailProps:
	AlkLxVwsndm0VyxXF8Qt58maZsxVls0aZowwWPaY2eFhIMI9PJxQ8dhjb6HtS1G89UAdXdswS94BsiI8UZRPygvmXLutu1H5gemOpP5qqu/58h/UIRXkB5YWl7dakX2/bjytFgMtuehH4I9gLlZ0v9Ol+nKylO151oGbh26Qbj11i15HTyF3Qtqx7cZEzouJ+FLvN3SM7iyTurch0wDZv6GPskHWtuJ7z+sIE1HOGtYvLIcJVDz7ffP+CL0EvKQCuuldev4cCeB/3Q+SZjzMCTFp8aXSHiMtCAZo26TQvmi64WTIRyiFOI5X8fg01X2hmgE+2FjpNTSzMHfiNtD7kTgCwkVL2crxFwlQrwgeaNqP7koFYtYglhMHjX4rj86b+n70yfev6K/lJsuC9cre/ThYhfrEb40Tf4/Zd+PXfjiIxhbWCiVzoxvbnNbyv1VGDi3PqE60JJig3aIZfCY7ouRdBGitVrN+7ZYiw8jhhSMOVOG/f51zpg0N875AEIULwA9lQHUxpSTbxoklV15riwdeRzko8Tlc4xWneEejRKs6HA6mDUTL0AqSjmBbR/gyeU3g4mWJCUYNCVP0jxRo6f2/Gh1tHBfNgjBnr/lJHJM7bJAwCufpUJ0nAy246fN/FkSENd8P/UBabzRvTURkkkYI9dk/KaRnXO4c/rw4MFRwF64KBk6lJfw1ghCrVX4m5zaf+e/dFTl0ifk6p/m3LfJNbJM/9gLHkHntsAEZiJO5Q8AyS1pGNvappIhiELmJk6Nm5wjQQsw5VcapqQj2bFALYBRujBZI
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6050399003|4140399003|260925184616899003|24021099003|39105399006|20031999006|8060799015|19110799012|24121999003|22091999003|24071999003|41001999006|5062599005|23021999003|15080799012|5072599009|40105399003|26121999007|3430499035|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aTJLEKLsciopkmeytGSyX8mqD5OKFkVRZ58jh8sNNPCx1OFzLIyMlCa6/SLQ?=
 =?us-ascii?Q?2mfsP1cWU0QIszIuUGx4eroL4sy0/b4PlNL1ZKxr6e4ugnY0BjcKu8J4Vy79?=
 =?us-ascii?Q?Wsa1R841wWkvgCJE6S9CAMwvKKtn82L6u7Er00OatWeq/S5jfFBEIkqBw/k2?=
 =?us-ascii?Q?i8KeScdK3l2XOeCfZXxUsl+w6cziwFA84OcL6VqiPpE8/8vlnoRDULV4tU7Q?=
 =?us-ascii?Q?JEW9ngkhN5Z7Vao5kvj+3qrnD2Jv/XIRa38ooiP96ypKXAa3d24/y+rzHxcR?=
 =?us-ascii?Q?f891JJgpGEoCFSGqTYehwoIW5W8u5b/8pkwuqCwmVs9NIP3VWuQE3bIGTTYG?=
 =?us-ascii?Q?oUPlCZrshM6gQ99MgH5RXHcstnkBwT7NIZm6HJLbU6fQvdyAAFB/af6XvtFE?=
 =?us-ascii?Q?9ZZdzTOMCqLUrAIgNHD6WdzqX+WJmw13pddlExe0+cFfLfFN9imymhn4OOFB?=
 =?us-ascii?Q?w+LyZ7doORzMd0ltmlfLCROQXOXA8NhWLEgXcJFhqzgBbUVrxcux7sdsqvIm?=
 =?us-ascii?Q?5/QVfiIP/q1I3bdcYbMl2OwkLZoA0c3Yfa0/QdE/4+T3Ss9HA5g786e+yhw1?=
 =?us-ascii?Q?ubYFlBtZivJNLW/bLwKg+oVqgGJkcaAUV82thsldQms4XBct7U0bjyXUJTEQ?=
 =?us-ascii?Q?s1tCNHblxbsccap2WaPEJdhJK8Uu19JvXyXf1QRStx0uLJ/lo04AaJmOADEu?=
 =?us-ascii?Q?cCXfw+PIwAJtAR5muNM+bu2F9o13usjOgBU9f7gDRhyRS5fmW+AI3w9ScE/5?=
 =?us-ascii?Q?WAaNX94RfHQJd/ugEkAyNWsaDitOENVR7keIhe/OBIgWgh9dzAaKv+KMjY8b?=
 =?us-ascii?Q?Wcvbnd5w7uiAL6NsBtfpp+M+rPtyzk9bE4ZuEqqFtSeDxdkY0YKx4Ya5jDvP?=
 =?us-ascii?Q?KAJhavZDSJjq7ymzEnZC0baCks1VsLXwZqoqRz+2ZgS1e9ODZ4T0970JRN+x?=
 =?us-ascii?Q?LB5q4PG8r/wE7Ao/HcN8Mwz7/AmtNUSUXgLlGndd7Y50Xl9pRceRvyXyA5dr?=
 =?us-ascii?Q?/DcaZSdNL9zmn66f0lQPXaE/HRVjxigIZe3a/+I7C91n+Ag0dMs0L4y5Pjcv?=
 =?us-ascii?Q?AyR4fwZH2uMZEP2UbXyVS8MYEeSbCsEXyguahwJCSUSsHjyrU2J+YM4+0hvR?=
 =?us-ascii?Q?PNZL5qPHV5ZOtT7QDKs3t0jtoyl4hm6afnh1LtWM1iVYJGzX9gkCq7CQtS5Z?=
 =?us-ascii?Q?UVSnhrO6bloVMimN?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Xy2EiqMl0mJ2YyWMSW0m5ZpQ2H2T8T38OBntaHj9SEyr2SY8FxKTpV2y1rv?=
 =?us-ascii?Q?n0oHHqFyW6c4ajKp7A88njrXlDEvid8o4o8+yHzT8u2CeZ1+wGr+LBvsJA+6?=
 =?us-ascii?Q?OOO6Rm2K4aiTDgR4AAGtaK/Hve6+2lLbTLVXcCplToUBqbY7Rjotu+jQ+I4o?=
 =?us-ascii?Q?dZ/AwI4gPzyG1+oINbHYSVAYPXtjgVFhKV69cS+AmLS+xyW0l8dfMgU3ybWt?=
 =?us-ascii?Q?f+JvFyrdLFRmYLLan718bBbNPEwPgeRh5Qo2INi0ESOrDFmGeXK70jzH2lMt?=
 =?us-ascii?Q?aEDi2uMHSLUkZrPNs0oRFEXbsawBP26wnAa55i8NZurVjRHt4opgsNfVLLfM?=
 =?us-ascii?Q?iCATi9GXpLdGWvAhB6+tLJ+VBGMHfYrFchKdIRLON9CLpSlSTpJ44y2zPnkK?=
 =?us-ascii?Q?LgwOJe2291iSzclD3kERrsNi7u3ukszDwps3wdpoyGaaOVR0E3PdgXE6Q2UJ?=
 =?us-ascii?Q?ysEhhnYSjrY4TA3RHQQrbsIMTZ4euNR/2wGBqoZtQYiPQeJBaD4XRrVNncq5?=
 =?us-ascii?Q?xWmHY0vPnXR2OJgO+5xs01irlO7OSdoRW89HmGp47RrWVUbv8rGldYniBRd6?=
 =?us-ascii?Q?NcBU90fKyX4a8bnh+Im2J5s8tu/fnfatXEcqJI1iD/eh+oWR+jmaqXAXAUFH?=
 =?us-ascii?Q?ai9rr/y5QGKiAB/0MpWtZzeUdeE3bThNK1zBSuQ0I/+9EzYTTEjGilEo5h0u?=
 =?us-ascii?Q?fjz2PS+pkfhAmOFkOcFJMT0fENyWwt3SJtgHadRVhmRQC9aYbqB+UPDwnVtz?=
 =?us-ascii?Q?71YXS/0b9smXU7u8k+VWIuSGeQlaGaHE81hwoiriaoRqP5nNWzsx1J2qJ0a2?=
 =?us-ascii?Q?7bN0wd1UwJoZq8abCs0kOoNOLkU4NSOFmTczgl9yNjRwUyK4sEeVlyKbB2dO?=
 =?us-ascii?Q?mQp4KmsDagVS96whRsFtrqSN2mBIEqQTn9ORG6Uhop+xs0UXo/4jJbgQdHHZ?=
 =?us-ascii?Q?76Pp6BR2S2y4Mfw5AtDfVF0yL4qZN5nn1IlZbA4eCAjHLi6cWWfWxluub7IG?=
 =?us-ascii?Q?2Ij8TBF4jbwYb6PRoEpL+tXZo06jyw7Hr+8EPDJm6UlJqjh3tHZFtEKDDHHd?=
 =?us-ascii?Q?PcHXP0q7wljsGDrI72/20hJOTwEFx4/OKiJnmBr6vJ8BiqKQU0hwf+N5jIzM?=
 =?us-ascii?Q?j/DkSOUb8dflqStKKWiS+Osw++Y410ICd17hhuIHQCxWdtvaAkqk21ZU5Xgt?=
 =?us-ascii?Q?HFwrvp/sPawQUCUnNtJFRYFpc6MX0S04VGfw7lO5SEiNEhud4T5PrF69NQ6e?=
 =?us-ascii?Q?yBiGKTm+4VmL/Yj1m1ehX/TrxwgrCeKauXaoQbPnTHPRaLlaphVw2Orn0hF7?=
 =?us-ascii?Q?+EAcL42iSnkdsqCjS0U5RCoZJgKsrNrLVZbGyRADRaS/e/xAfhvyo3izUe42?=
 =?us-ascii?Q?NNaFHHEVsq09TpEwlrpI1ySMJCsU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5d1ddc-8956-416e-7c94-08df453231b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6658.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 05:10:00.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5177

convert_csv_to_c.py validates register values against the regex
'[VIU]\([^)]*\)', written as a plain string literal. "\(" and "\)" are
not valid Python escape sequences, so with Python 3.12 and later every
run of the script (e.g. "make c-files") prints:

  convert_csv_to_c.py:47: SyntaxWarning: "\(" is an invalid escape sequence. Such sequences will not work in the future. Did you mean "\\("? A raw string is also an option.

Python currently keeps unrecognized escapes verbatim, so the regex still
works, but the script will stop compiling once this warning becomes an
error.

Use a raw string. The resulting string is identical, so there is no
functional change.

The problem was found by compiling all in-tree Python files with Python
3.14 and SyntaxWarning promoted to an error. The search and this patch
were done with the help of an AI coding assistant (Claude Opus 5.5).
Tested by checking that the script now compiles cleanly with warnings
as errors, that its compiled bytecode, constants and names are
unchanged, and that the regex still accepts all 95 register values used
in the ni_route_values tables.

Signed-off-by: desobei <desobei@outlook.com>
---
 drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
index 90378fb50580..d19101fc2a94 100755
--- a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
+++ b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
@@ -44,7 +44,7 @@ def routedict_to_structinit_single(name, D, return_name=False):
 
     lines.append('\t\t[B({})] = {{'.format(D0_sig))
     for D1_sig, value in D1:
-      if not re.match('[VIU]\([^)]*\)', value):
+      if not re.match(r'[VIU]\([^)]*\)', value):
         sys.stderr.write('Invalid register format: {}\n'.format(repr(value)))
         sys.stderr.write(
           'Register values should be formatted with V(),I(),or U()\n')
-- 
2.53.0


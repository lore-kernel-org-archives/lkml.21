Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625814;
	b=jXyK3950HbwKjGpRL3dxGN6SXIt5nrU/PG9CcuO/5vnAef2DMf0ywc3slmCnpcHu3Bhb
	 2kwtK96/YMUeu4PvCX6WVtYo1jPcZ+KKJXewBe3O66IaBi+JSCeAILtMJiuXdnzBJ7btr
	 UYXKdqel/rR7EAIUbt4X8cAt31E+6mSElZ3w2jGquBKo+dd9HNaWypK9aHhFRZtXS+EYx
	 tkRk9D9zMTAs2NlAap7TTSwBPAvTTVTdndEsBNaGCi8Wg2fVd+UN7aQ/3pRBymmVSnT9c
	 UnBR/T+aCsHQh0EQMMxlLrMfTHPVFGUbSuTNL93XSWOk3XVqPyUbrb+ulxDOOC99YWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625814;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KbOKodvJUyZ1jKWkvW39WJ/BFDQzu540GkqbOaClC+I=;
	b=QYYrbIk3INbdwvYt17RdF+n187OfJRzOtgqOLHeslw7tK0DZ64Das3E/X7Px1L4n+GRO
	 UT2SbBVbhCh2Ss6I/48D/z8vd26slsnBYwQoJHNPbKODfVkkJDMWFX0MlJ+f1W+ah0rWB
	 1+c7sLF0z/dh7HCe5J/Y5Yjy1lore4nDoH03QUhi+ejiyrcI8GI/+AgddgAE8cXD3ubH5
	 fTue1Q+pG0ogmrpSBefwyEHWO/b90ONqznb6sIK8G6BulyFd58BPbKW3f/Dgxh/d33Me4
	 U9HsQrFGirSQbX/TGbmJ+5wx4bKSdV+nld+Jvbs8Eyr2KOr5qAFT6GIez+9TLyRd+zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ig9A9fOU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.3
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F4606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6F4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ig9A9fOU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2HfXNq+ZSIYbqrtejF+nVQZWoKpfKV8cz+V/bSurrJptNa99W94uMTsmCjwAt7FnHY5ah67PykpHYnlIi9OZzVUrxb6OUO6cfCIG7Dowgv6QtHuyjp2u277gouBYXBhns49g1/cRrwnLAhSOctWtJV+9kRG4PO/zZCklGPCJ9kwqjVvyyAzXk+iy69mXmAvBKINzBKZqK6k/d86unbwTEmtoLt5MfAidNHoSNNKlUj7IAo8hkgzcpYOYni4diWuQWn+saOvYaqQd+hup69UDqhwI2b+E1fv+DdpakSbrzVOYlGy4Ohib3lmCO39BkXfM3KGL9mXqJVwCscbRd6+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbOKodvJUyZ1jKWkvW39WJ/BFDQzu540GkqbOaClC+I=;
 b=RWADG/ohsHJBbIXsb89safOpunPrD5LD138XjGTgpPSmhM7lTx1fGtmYYXm0sA7GvD8m9K9ftmnr4HrcGybVSTuO4ugh1ZNg7j6K81Xg9Ap4l2GTOjuaMvEzXtmJSI7oXc7iJXvFLz67qG9vkHIi03hkb+HwBrUuSR0Y9sRFCLy6etX7cubWeQVT4atx+Nm3w308/8XsUcRpQclqKqy7f7l3KKOflQSvug1ajCfF6w9FvfTO05vzzPYQZ8nNmd8wPwL35ixj4rBv4EivLRVxtvo7pADfsxO+cse7VcuXmHHcP69yChO2xdAE7wgZ4Ql/KQnhhigPLIxakUJlPzMB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbOKodvJUyZ1jKWkvW39WJ/BFDQzu540GkqbOaClC+I=;
 b=ig9A9fOUX0sQ+2d1dBDLoGfQf7rMhmykhcWnebWantKCpWGm4/bbD/i75c0/F6UXIF6s5A6EWffsJQ7FVL00iS90oBuqRGAAjHqxp2T5jxidcATGwxokh3sOJ1YR0bOdpcNMu+JKNkKjdSIo4kGcCMyfwUwNg28oKiXTGFykKNjwBtQ4k6VVWEoOFDIr8VOd++S9hR2Z3xneI+p5FkXh4rS1jXp6etQWOaoSLUEzVrtXCA2QuM0ajdow3kcAnQKauUa7vvLGmT7PlejI13oOrPdAdEkhJESo0jpCfpPxoJMbOq7ObnpzC4cLePQk9yFHup5wYBCgMIVskJ3g7wo1fA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.4; Wed, 25 Nov 2026 16:56:49 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%6]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 16:56:48 +0000
From: Zi Yan <ziy@nvidia.com>
To: xu.xin@linux.dev
Cc: david@kernel.org, baolin.wang@linux.alibaba.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
 kas@kernel.org, akpm@linux-foundation.org, chengming.zhou@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mm_slot: introduce mm_slot_next() helper
Date: Wed, 25 Nov 2026 11:56:44 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <9F5937BA-02F7-4938-AAB9-97ABD4C2DA76@nvidia.com>
In-Reply-To: <20261125084205.345860-1-xu.xin@linux.dev>
References: <20261125084205.345860-1-xu.xin@linux.dev>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BL1PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::26) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a3b848-2009-415c-5491-08df4b1517fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|261021121427099003|261102123227099003|261021123027099003|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I6jjwVMIYDaDO+X1vvY7iialpGXH8U3gUdH/+Al+Q4DdU2YrJzPyPmtLY1WEn6KpGemcOWYFo5+OttLMxsv50oTeNpu4qRxN/zPEeyHMDvuu4HqUm2IPtX3oMYT+Lp9HE16Mc8CSkJbQGsAeBQkcB2Rt3YeHNMA0y0eeUV4EvM5FbZiVvDg0qyI0dgoLdCE5BYvSTrsZy63PZS+/U6bIAvD+j04tTt0nwjC1cuXtlaHBnCP/rIwf0n3x1xHfr+hM/c2HDtBUil8x0CrmBkATSDJyiUYZpWS/TBC1E+SwLiqKTH/AiOJ1tjeDgB1rR+Nwi8jYKFIf3/wQPeDSxrm7O/aGsMmyQ1Na5DEAMlf6WWVqEEzZFpHZIRxkT1V9GGgrrL/4ddsepuwY/iaB7a9IDJmKmaN44TPyLlqVd+8cSRGiQ8A7IREaKFjbef+Oik2c23RrWFvQfCctOMf0/gK+I26Mh95Xb0JfuEjZb5ewcc0+R7UehqlI2FRCjVxB9Sm2Uxq3PMLH50gLK+0LPXUk8xMj9+nVwSNENylkIh5j3W/o02PrBx7p4jPFx5ayEPnXFe0k/7sxJUJ5hefADyDIFwGg81bHUqtw54jLOtnYsayO9sW48/6pMIbF8joNPyPD76vBVPKEOcJ1gA2AyoYOBNSO7CrqFI3Lh3CQAXqvl0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261021123027099003)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BYqxuUWdZSsM0PnNLTH7UAU5oCfUhGbbdSxMVgS/WkRLSHKM7k4qkoS43DiN?=
 =?us-ascii?Q?SbCvfo3bV+eRRBw6wnrDHcl7K0tGBm9qyuoFEAasATjubFHxr/AThomvPqsS?=
 =?us-ascii?Q?kqXJjRUesGyWolVOyeDTAmDM/iZQhiHEDUIWePZKJvtrAyd8cf0hopYUpkvW?=
 =?us-ascii?Q?6B+mUFLVSjv2yt29jWHYOcIeTbCWd5Zy7G9RU8R4B29aPTid3cI/HLnTUROd?=
 =?us-ascii?Q?H1Od/hBexXzeq7RiDLITCbQN7KtEGZWSfMZaJnDxHelZ60tlw43D/gCZPWhS?=
 =?us-ascii?Q?zfOqBjrZTssmKDsd9iMvbM+Yr+MUbiUIWsA+ndcz73Xt6mPv0vZSYoeZWzgN?=
 =?us-ascii?Q?wRYpmXvbjuN2ciOcOD1te5odojgMpphvyLPm6B0F6UqiVlwr/t3aDMUZY4mA?=
 =?us-ascii?Q?4za/HoTSRR1AkAP2DZF/yBAMZ+EFvGWhfwESLidqVdMKw5Gk2sRX/6MCed3C?=
 =?us-ascii?Q?UyEfZLf5HTt5LH80LQqNVonTCZei1QluzRCvkD4SmbzQ3AeLvBFyRuYu8c7X?=
 =?us-ascii?Q?EkBx+0iPrjIVK0Vx2/Xxk5ek6Z3EVDm0SIZHQJch8RtVT9CHKKs+81WjH/48?=
 =?us-ascii?Q?QjlEMi/p7BIlhptKtiDbfbVKsP4tLknZcAr69F9bhZGdnvTM25GuaQMBeH9e?=
 =?us-ascii?Q?rQ3/ez+W7NowLMHTIuWEMQCPa+06LDMeEPH4EtW11Z0MBlDd0r3/FkoqSMKm?=
 =?us-ascii?Q?qwQ3Uq3KWlfQlpvgB0Ts4tJRcDk51/LpibPw8QneOB1IIHhJvebAAKR5oqqw?=
 =?us-ascii?Q?L25nTrRWvGIvdYe+O/B1N7W0C2MQBY+lmkSDp0i59sh/bxLgxY7P6vw/D6wX?=
 =?us-ascii?Q?iTxZZzg+cqeoDu5RmQJVKCVX4AvFVtgUnAmw9iNjMuTUsXVcs3u5enxpvKIy?=
 =?us-ascii?Q?fOjNS+PbDaRcCNyRvmEpYgIVSTE4CLaEAWTOxXmfrlPfnUITFBrqE/iRF6fi?=
 =?us-ascii?Q?6CYU7Yomq1BJqpNDJzzntTbM4HOH34u/ZL3Tv6uIwzdh/5bIIMXExfHeFWi5?=
 =?us-ascii?Q?RcdwKMVzhC5RmV/gudyynxIrLZHazRTCnRzjukBwNlS8zu2XuweCi+RFXmUv?=
 =?us-ascii?Q?t4XH9+PU8mRz4GGF6hj/b8WbUhsXVSwbsNz5yI1IPsvbjPsIfA+j8hi6UUNj?=
 =?us-ascii?Q?S7o4RczCIMBrVP3VEwMgA/jb1EbcIq9ymIvJq/gsB7BzYgMmGvL3IJklu7wt?=
 =?us-ascii?Q?Ewea1BBL+B1kAOQqcT9g9ykMfRIbvVScWQlYSMo0DyduBA+zxU8CdfUEiJ7F?=
 =?us-ascii?Q?W3mYWAgCtPkEKd7XrXC+ExctRTzjoDuDhoY46fd7X0D+snjJeZcHLPr/zvl4?=
 =?us-ascii?Q?gvnq65AiJykWmnO1C6C+ly3gksGsq8lsLhF+46YCMHj+9gt1Eh6Pje1RuIK5?=
 =?us-ascii?Q?g7LZRULoSXDF+KUZQwnsNyOf0MibkXtbG05gltIAUYEVqi0xUdWirNH0/30s?=
 =?us-ascii?Q?8yP4VjJJbzHB0Qp1Q9I3Rpi+ST0PKsvW71AZYiI2Vf9xfPlu4ItuQg9qL0Dt?=
 =?us-ascii?Q?AWJF3Yn1WQ3j0TEUsWt2GCPWr0+ppkA0hYcS7sQPbxc61YEZ1sVT9W8xPwbu?=
 =?us-ascii?Q?fJ1qpCNVoRNwH6sVsOtU6ue9xtNKzbFfr1jz7g9lki0pYuhHOYrENQPUWEtO?=
 =?us-ascii?Q?E8N1n8BIw89OX9yqWFb/QVIGBtGgyGDlZL6nugW8RhgwqRUFiRuIUtZNg6Cp?=
 =?us-ascii?Q?egqz9QlM0MXqg7kBDAe3Bro9WZAwJ5IlyqcnlvNyBpy0021E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a3b848-2009-415c-5491-08df4b1517fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:56:48.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2F2yXz33Dff9mFI0DfKqM6z++YVGgfz2+YdTb7ZxFtLL73xO+28KAgIQ8lkziHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051

On 25 Nov 2026, at 3:42, xu.xin@linux.dev wrote:

> From: "Xu Xin (vivo)" <xu.xin@linux.dev>
>
> Add a generic mm_slot_next() macro to simplify getting the next
> mm_slot container entry from the list, and use it in khugepaged.c
> and ksm.c, just for cleaning up.
>
> No functional change intended.
>
> Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
> ---
>  mm/khugepaged.c |  5 ++---
>  mm/ksm.c        | 18 ++++--------------
>  mm/mm_slot.h    |  3 +++
>  3 files changed, 9 insertions(+), 17 deletions(-)
>
LGTM. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

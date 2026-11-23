Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457221;
	b=HC2VU3f1cnrj1oPUXrIJXchTa46928BPW8PXYFU1iPFbjn87Q9PXL+/EabxUVJhpta5b
	 q4xW+TJ6U1hZk27to2D1Y7cmxzfO9V63vN7giLGlZ84lEFbXjGdmAWW2qtEnpzLVXjO5o
	 arnzX36HpFKxo4jWydXF2zS+/aCh2+NIJN94hZBBeCMG4Y/9qfQ5pjhNstRfBGXkDdXUk
	 F9Z5Zu7SoD7dzhPCOkFvr0q5/FWena24SIl+U81QFntRtsry9Ado8Yxwvz0+A4UGUQfr6
	 q0gMEfzG4csEgYCfCwiwhim3jfZLVOG7+XtkqKDXBJ0O9wvmmtWUw1VcMoaxoJxmTwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457221;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:CC:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IHTmxbHxn82H4dc/UJblkO6uxMI03/2+cMb5keHMoM4=;
	b=jS8XloM3b4W2HtEvjzmeqSb5SV5/VCJAk3vHQ2otcotc/9EGrobSuZI9DndIiPOOPRGG
	 LX7+6yBuw+JHOCrXuLDvoC5M0n0jv0F57UNMhy5hRCTp4ShF2TOPdFUKP62h3Ww3EeAaU
	 oGQzeuy2EfBNzegWywOErZkNxEj8ME8MM0gj56T3zgC5zQ+SPf17xPqifsF+g2RxkQl0Z
	 TuTGEXalqAke+eqE7+BfIT5srBKTvJdlKaOJYhydirHpZOe2x3QLrmibFSUksc1IGBh/Z
	 EYdbOrrwxMYCvV094KhW3w6q5jW4VTM2XKynhXrPl5yTE8nGaqijab3L+USM/ec2Tnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LebVdegQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.13
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C91D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C91D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LebVdegQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSDxQZetUhlNverBMjGGa52v5DwX3IPL04E4E4TNdgKnac5o1+h3OshUitYrQy11gINS7ECIDaQgTdTuw3qh5o8ihQo6KL6A47MxAIU9na+pa/SFfDVAxs51DnZ/rGPGSqMICMip1UCTa308oBBrZySzXwKKF/Rz+Djxajj2MYBzSM0KbLJvUrxKqhaQ17/zwdYOo4Yn4U3ojF2fImIErVkr8o0zHaBQnK7Hge+t/JvszLTDp/piy5wKuC+27KQEkLKu1komiX0CMGVZl3jLWmc5rxUxWQM2vy2JX9Rg2/kewKP2jXd0vE5gbLJ9/wBq2diesMucOD/N97P2lCuv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHTmxbHxn82H4dc/UJblkO6uxMI03/2+cMb5keHMoM4=;
 b=OKaf+3hclN2oa/2Hh4H9YcY++gNscLdJ6PymNwtwXHgtS6ObQohPsHucPHorKz8ZN1jHj9NDa/QV+ZYupsjguqVEUb5ySMqhQpyKXndIUm231UIAeOMsYD5CnAJoOs5gBaKVNhPPi82NLmASFN0dvd3pAF9SabTwWkrbM+calN4/QoREZ8rsLF6wnYnb9vz0icOy7KKezzyooGuYn6zebOJ5xh08M+53ThVuAFd1YJrgAoxm0PR49/DhN4n0V9rpmtLuXSiKonKb/jo7SXmauAGsC8UwiQlJhjNKd2CMIGbfYdITEhepuluNmdP+AWxvoGn37OUI2P2V/k0SXSy1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHTmxbHxn82H4dc/UJblkO6uxMI03/2+cMb5keHMoM4=;
 b=LebVdegQmv+uIEeiG5NUxWSm+nC/rg4MqhY0WkyrV7oO2u7i3AZQXwloMl7KRjPirEGFUP0Zppzxg/XF8Bxv4jV6tocGc2bHV8WQj0mdgjo7MaWikIvaQUUw4xYAwOhVvqXnUFtupItURPThltQ8mDb0k4+1Gfj2NygFSJ8FPMc=
Received: from CH2PR19CA0022.namprd19.prod.outlook.com (2603:10b6:610:4d::32)
 by IA0PR12MB8839.namprd12.prod.outlook.com (2603:10b6:208:493::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 23 Nov
 2026 18:06:53 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::39) by CH2PR19CA0022.outlook.office365.com
 (2603:10b6:610:4d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 18:06:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 18:06:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 12:06:52 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 12:06:51 -0600
Message-ID: <937f65e2-7b23-f523-8ede-9a166a28d00a@amd.com>
Date: Mon, 23 Nov 2026 10:06:51 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Reject a zero sized buffer in
 amdxdna_gem_prime_import()
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
	<ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>,
	<linaro-mm-sig@lists.linaro.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>
References: <20261120023540.888381-1-lizhi.hou@amd.com>
 <48d1dd13-9ec6-402f-8a72-ce417f331332@amd.com>
 <a94437f4-f0e0-dccf-3dac-1bc1f0dda835@amd.com>
 <b59cd917-4709-4f9c-8cd8-afdc24138d85@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b59cd917-4709-4f9c-8cd8-afdc24138d85@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|IA0PR12MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c956167-32f4-47cf-8694-08df498c8d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|261022105027099003|261009223027099003|261022075727099003|56012099006|11063799006|261026121527099003|4143699003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|10067099003|261102130727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yknLkrEzVqdp/8zBJ9iEzXOemf3rOHSTZPTuBAWOLWPx4JrhS83Hq9TzwCk+tkKytsSLeSLPNeOVkVq/dc5KRaX6OhSI4C60YROryoN5sqg2iZMcJvvH4NQVh+FfHEAoLZpk4EjBWM10l/Rkm35UKINEDIi9m7pr8Ix7pr8H1DoxExCqLTMrdGEHa5zN+nw6n4DvcVxqbR9eeqvQTjlqNYkM9vAXdt6MeN9qwCXZzQfo3BTK/9GGEQYqxeobLClx3n+g6mpkkUs+38+QdXbCWom/5d8Y/IbAOXfNtjxyrc4RGx2eQrFT1tWuEr8ai7AehlTC8J/DL+vbQEbcdu0HoIYlhEua8lwM3e7NwLpnCZAmS3s4U9zE2mNha33wRmRlL2lsXj+R7YFbWWFjzUg5DiOXSTlgizXsLVjxkqlNKyrFb2grkfu1orq2HCN8hBlLyIWgWzLBfZXucHJMqjaN73MyKQeQ1cUgseRXHt6Xd+ULl5QPxdPeGPJY/pNc9zsullEe+S1/ixQ8X7TDfG868hei1rt3rE1t9j/rUSyKAY2yLBP3EF697cac6kbDAKXpRZ7P1OL12MyHhEoodaxP5cjjyvRaf4b5BR1i5WERyipdoSnFeTNf8kljcF5zlAHhhD65N0vvSLTJxNhXC8h2QQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(261022105027099003)(261009223027099003)(261022075727099003)(56012099006)(11063799006)(261026121527099003)(4143699003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(261102130727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+3keNc4PKzJqRw86eigIFr/4cxH9G0Q47qxLbe2yJSm6bgrc1EBeR/uZlCHlVkovSe4Kr/zT81F04QivNDdkZX57YffFHRKYIuVgXpjsKhPpoh6MKvqDKPfCmPZUyUczdh5+YqlMOpqTCD9n1ysD84cDEJdOOYqUfBNNJqL7ptiL5xRZrcmhLbrkC7N5opteehyeyaQmCRDMGzzHk9BWjJDRV/PYcI/E+JX+xR4sVBozuaDIhp7aZ0sVUVm5IgE/agwiMJaRtFwfs8bXkaTbi6BWkt/m19tKNiXP+ER4D/C+L1qeelfkQ4G/sDZzXA6AX45FvOWa0cosAenrKokeQo4NyQENTNLGwuNL+XB5WhZcR2nKXm7dz0szhrOCxe90S6NU3wagiJwP/ZyL23ue6d2YaBki59mRjAIN+wjXuMQS6qnhichqhGrvlGxk3doX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 18:06:52.9101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c956167-32f4-47cf-8694-08df498c8d93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8839


On 11/23/26 00:53, Christian König wrote:
> On 11/20/26 19:44, Lizhi Hou wrote:
>> On 11/20/26 04:32, Christian König wrote:
>>> On 11/20/26 03:35, Lizhi Hou wrote:
>>>> Zero sized buffer is not supported. Check the buffer size and return
>>>> -EINVAL if the size is zero.
>>> Oh that is surprising a zero sized buffer shouldn't be supported by DMA-buf in the first place.
>>>
>>> Doesn't DMA-buf check that somewhere?
>> No. I built a local test to reproduce.  The test driver calls dma_buf_export() with exp_info.size=0, and it successes. Then, import that buffer and get the stack.
>>
>> It looks other drm drivers check the size as well, e.g. drivers/accel/qaic/qaic_data.c, qaic_gem_prime_import().
>>
>> Maybe it is better to add the check to dma_buf_attach()? Or I can use the check in amdxdna for now?
> Yeah, I think attaching to a zero sized DMA-buf doesn't make any sense at all.
>
> Alternatively the the check could be in dma_buf_export() prevent even creation of zero sized DMA-bufs, but it is remotely possible that somebody uses this for driver internal buffers so I'm not 100% sure if that doesn't regress anything.
>
> But the check should definitely be in DMA-buf, otherwise you can do very naughty things with drivers who doesn't check that.

Thanks for your guidance. I have submitted a patch to check in 
dma_buf_attach.

https://lore.kernel.org/all/20261123171114.1451429-1-lizhi.hou@amd.com/


Lizhi

>
> Regards,
> Christian.
>
>> [89432.394897] RIP: 0010:amdxdna_gem_prime_import+0xb/0x120 [amdxdna]
>> [89432.394905] Code: a2 29 c1 5d 31 f6 31 ff c3 cc cc cc cc 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 48 83 3e 00 75 14 <0f> 0b 48 c7 c0 ea ff ff ff 31 d2 31 f6 31 ff c3 cc cc cc cc 55 b8
>> [89432.394908] RSP: 0018:ffffd04344fd79d8 EFLAGS: 00010246
>> [89432.394911] RAX: ffffffffc10b4bb0 RBX: ffff8ddb05863a00 RCX: 0000000000000000
>> [89432.394912] RDX: 0000000000000000 RSI: ffff8ddb084ebc00 RDI: ffff8dd94b17f000
>> [89432.394914] RBP: ffffd04344fd7a10 R08: 0000000000000000 R09: 0000000000000000
>> [89432.394915] R10: 000000000000000c R11: 0000000000000000 R12: ffff8dd94b17f000
>> [89432.394916] R13: ffffd04344fd7ad0 R14: ffff8ddb05863b20 R15: ffff8ddb084ebc00
>> [89432.394917] FS:  00007f8216e08740(0000) GS:ffff8de0c09bd000(0000) knlGS:0000000000000000
>> [89432.394919] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [89432.394921] CR2: 000055c3644b51e9 CR3: 000000011237f000 CR4: 0000000000750ef0
>> [89432.394923] PKRU: 55555554
>> [89432.394924] Call Trace:
>> [89432.394926]  <TASK>
>> [89432.394929]  ? drm_gem_prime_fd_to_handle+0xdb/0x220 [drm]
>> [89432.394974]  ? __pfx_drm_prime_fd_to_handle_ioctl+0x10/0x10 [drm]
>> [89432.395003]  drm_prime_fd_to_handle_ioctl+0x37/0x50 [drm]
>> [89432.395029]  drm_ioctl_kernel+0xb0/0x110 [drm]
>> [89432.395069]  drm_ioctl+0x2d6/0x580 [drm]
>>
>>
>> Thanks,
>>
>> Lizhi
>>
>>> Regards,
>>> Christian.
>>>
>>>> Fixes: e486147c912f ("accel/amdxdna: Add BO import and export")
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> ---
>>>>    drivers/accel/amdxdna/amdxdna_gem.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
>>>> index ffe12a722dfe..4d7f3de88cd3 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>>>> @@ -1133,6 +1133,9 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
>>>>        struct sg_table *sgt;
>>>>        int ret;
>>>>    +    if (!dma_buf->size)
>>>> +        return ERR_PTR(-EINVAL);
>>>> +
>>>>        get_dma_buf(dma_buf);
>>>>          attach = dma_buf_attach(dma_buf, dev->dev);

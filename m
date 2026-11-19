Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053380;
	b=vLirwoFBbOFuSOf5vIAWIZr47DMP4SfqV+mz1CxvFuIdbiLre5nAkPAS277RPjUT3A4N
	 B4/hmxnIxJIKKJMvr27qBL3cCbwr6J58WQBAw/fRiQcvXcpfkH5gMfYNpkaO9+EjzTax3
	 F7/lp/JWDO2XgRm9SMDGIVmuxqHtrsSbGAhSft410SttySMq939F4tZ01kEm5WUxbYnAI
	 aVoqaKFzhQvzy6wISyQ/3mqYr+YWtOvsSEX9Ch1Ry3c8cgcOznYgf9PmpngkqKQTrGPvi
	 N2aWKtXeT+l/sjy0cSln5RUlGYT4y9kygE+tzXPjlvWROf2g3M8ipztTiVaKHTI/ZOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053380;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
	b=4AT1Q8UyMC+8Mt+nb7T9ARL/8p9wjT6WuOBERa+0FEkLrEV9C+coCbDxqw483SjSH+75
	 IKg2AMsctd95lAlRIJPdUVkWjLojQaTnzJ/tCdFlCekVTW/i3W4TBjkVOtTGh9c3mbOr+
	 IDVT5O7s4PYzJocoaC7tVm7csTR7eAZWbIWv39JyBBo4VDiM96PFKuks0mKYOScz+P1XI
	 WJzByyMJpHKpAvROqvtYPKURfVTJGVhoGNyQuxb+9nVx1Y0wqFGawmoxQ8fDwj9s9xGT7
	 7c3t/JQD/FeJ/SKHwYnIe2axnDvzqinDJW1VZtvOVfZyb8TNNLwlzO10uqZzFKIiEXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ8wpik8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRSel+Rs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1937E606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1937E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ8wpik8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRSel+Rs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B2QI935817
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=; b=kZ8wpik8onPn1ay1
	52A6TCbS4W9+XlkiWdsPyfWSuxJj7taFv8LgkonOq98O4rWuoWz8Nskywf0+CrLg
	VejOGf2iQOhf8gpjiN6XJftitR2ZrrugxNA17yYMxnLojAVEVwHXMJBkO0+MH5ro
	0pZuwOchR2ycYmJ8u4TQNOzZISdcIHpP9wsWsb5FDiQXlfgjKEmc/njxQw2hZ+OG
	3xbES7Gy2pWxFPzN9uqTRq3PZQng1/S8NNlcw1wfeWa0yWhg1ybGsPHm876t8+VA
	usTu90r5khXpIGMcXXzsbZJJB3KdGv18wZMzHrQq3LQ8IlePiy5SCzC3c71HzcMv
	1jn17w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcrc90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:56:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so16886915ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795053378; x=1795658178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
        b=YRSel+RsA5y9BX+nbkOVpWjrHmslFoCpgLw3A5LE0wmU2r8IG5qukitVksQOT0pPs1
         pIKuYYrqcvPAFTKd/tmpeHoatibMttMSWTSafvoYmF19ejnhOd0mofIsIHblFTfnZNYY
         jSpMvc+1v3+eFXQoYrwayMsDjDa4bPaR6LiFdwTzdDuKNyuV72CNHbFIcam/PPiFzbU/
         qDJ+9ksFkZFqOl1juUTuSYZIFmOrK4dInnNhliYjYNqttwRSLFqyhcpBHoW3hTnzxhF4
         Ag/9yarJ1L7PUSaf3DB+ZYRNBWNRcDi79Crim+JR2/t373SgbKk11aRArWWK7qvXvwcp
         6AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053378; x=1795658178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
        b=r6Uyg26np5Ux4n5n+2lvJ7SKecA22n9cIsEX6KiDyvdQ34baxObpqfjDXNyF5hfe+h
         8VW6qkPfQhUip3FeMnlMoyBhUOR5aOSiD1caHmLjQGaPRAZeze41zk1qRX8JfeLZxTyQ
         jnHhtAQXZXSk/DLtt9bf4vQOPyxQaKkqDuhCc91f1KogdKm9zVf17V3AesC43h8P6mlv
         5RmI3DIwO6FA4W51f/z8Wf3RYyxXnejjI603EtAbqOMIn0CnHuY4dTNYGFVtEYDq5d28
         FmD6xgHHAZUwxlIKRw71dxHqWPfTPmH4MxnjyvHM+tOUfzQIf7pgaC3A4ktDirUCjw2t
         O6yA==
X-Forwarded-Encrypted: i=1; AL+hErFQ26YvaIr0lTb4qq8AIvgaClOXzPolMmKuFn6AdDOhbAgiK6Sp4oQd8ugEXrg0MMeyYLbotDjREcBUOAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n4FtKOQ3qb7K2BFNxrdGs/OnHTwPgIfNOQt90pZZPKOjGQ9Si
	K1tyCZBo9BJ6iPw31eJ0chDzSts01mbD+662S3IP6/rjz3UmAV7CXY42nTkAqe0JCEz6AayepBo
	SuMzq4lwt6Wnt90mR5vHsx+1xi75Nm+HnAw10qXWYaFvzmYUE86bqNYlA7xkNvmNu73Q=
X-Gm-Gg: AYBFou1Yeqb3pUzFNGT3Gct0HZ+b7JEOu94WiUqp/cp4/gOjF61BOChWJC5MulQ6EIm
	Qif1RM1zvmz3lNqBHDI0/6EFSUXFKMLv8Wz/7xGK46hH3ML0EibQuy3UuUHAeB7bb/trnISu+Xg
	CeST4NS7L57zVEQ2+G+Lx4CjnRNkQa1yOE3+5Hg46eSp8a0QI6i9Z3ssIqmDe0ymVNKNj1Lba51
	UzcKrY5I/oF9ukdIdP65EOGbNRvyevxdPlPF4dpAKKyjpH8iZjk6Y1Dzfhk/GHoXPz2RJqCLjN5
	a8qTfs+9TUVtYofAdFMkhnWgWnKkvJi8nZoHf5ZAvj2qgbFFLzxrl7Tab+pTpuaeameLV5nlXLo
	bxY/UQIFeKHM7UqiuaX7Cpd3VxqMdil2yPAJafqcJbLhQd+sSfm38tOcbOb/Ej8H8Bdv3DHvUDX
	TPKWpEDShqY/4HwwRS7oyN2P5qZDqNTU3oqKaI
X-Received: by 2002:a17:903:3bd0:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2eff72f018cmr37060795ad.21.1795053377871;
        Wed, 18 Nov 2026 17:56:17 -0800 (PST)
X-Received: by 2002:a17:903:3bd0:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2eff72f018cmr37060565ad.21.1795053377401;
        Wed, 18 Nov 2026 17:56:17 -0800 (PST)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff611630asm21473375ad.17.2026.11.18.17.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:56:16 -0800 (PST)
Message-ID: <d94a7c66-9dba-4513-9776-2aade1e74709@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 09:55:56 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
 <878eabf1-0742-45ad-892a-4c6a7b615d1f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <878eabf1-0742-45ad-892a-4c6a7b615d1f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ouCsuf3BDT4LkZPmWAK3oMV7tMuVFLVw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwNyBTYWx0ZWRfXxMwC0lfsoSB4
 jLMQIQ5eV+aCmL2SPEEabCnqdy/VsBXH741kQq4cvHL92OA8Z4ADMsAknOBVXOyJIpM6VWm+URh
 4N1+abxTtwxc+w1Adr+4sSSr2fPcnsA=
X-Proofpoint-GUID: ouCsuf3BDT4LkZPmWAK3oMV7tMuVFLVw
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afe5742 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EU-12QLy5lNSyVwEbFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwNyBTYWx0ZWRfXxUT3ZcqSwsnM
 8dKeTrT0HlZkwl9R2cgAojcDa+pxXDlmJZP1yNBGYCHeou1P2bI1q5lSrSyTz9TTX7hDm0tOkVG
 mgUdAxxNoo6Cos8FtkyVPcz3IBr0j2oHRWldJ97LLvESlqD3X2LgMj02xnv8hgE6oLiiLOvP33A
 u+iFypc68muLZN3d8WpEQU4jyckbodhIg3LlEw0iBXTShJ9NRABFLAxMJj1QDoVM7zJxTVjP5yP
 8Ow9QGlboSLJQAJpnfVYnfaRLDp+RXFqD5xLQnlT+NnMmDLaKTTR8noGj7aZ58Eyvcq6xp4fhsz
 BJKMDMLekfLG0WHedPPVkeSmiP7A9xvLXt19MSw0o9PRdQW8qU1Bl5NKK02Q+1RIu+P0G+0Pwbr
 yvk1U9SvdRtCSqp6oBQePM36wSSqY+MS7j+uYqBD6Ro66A//d3/24Dh+8cTOq1MhAwyGppwAc0J
 t4t3cAnnHIc3BQPzr6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190007



On 11/18/2026 7:33 PM, Suzuki K Poulose wrote:
> On 18/11/2026 08:02, Jie Gan wrote:
>> Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
>> etr_buf_list without disabling the sink. It returns the node of the
>> switched out etr_buf, so its synced data can be read while the ETR keeps
>> tracing into the new one.
>>
>> Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
>> done in one critical section. Otherwise tmc_disable_etr_sink() can run
>> in between and leave drvdata->etr_buf out of sync with the hardware.
>> Provide the sequence as a TMC helper, so callers don't need to know
>> about the locking of the ETR state.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index e9213f456834..5032f5598e15 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct 
>> tmc_drvdata *drvdata)
>>   }
>> +static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
>> +{
>> +    u32 sts;
>> +
>> +    CS_UNLOCK(drvdata->base);
>> +    tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
>> +    writel_relaxed(sts, drvdata->base + TMC_STS);
> 
> see below
> 
> 
> 
> 
>> +    CS_LOCK(drvdata->base);
>> +}
>> +
>> +/**
>> + * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the 
>> etr_buf_list.
>> + * @drvdata:    drvdata of the TMC device.
>> + *
>> + * Stop the ETR, hand over the current buffer for reading, switch to 
>> a free
>> + * buffer and restart the ETR. All of this is done with @drvdata- 
>> >spinlock held,
>> + * so it can't race with the sink disable path.
>> + *
>> + * Return: the node of the switched out buffer, or NULL if the sink 
>> isn't in
>> + * sysfs mode or there is no free buffer. The ETR is left untouched 
>> in both
>> + * cases.
>> + */
>> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata 
>> *drvdata)
>> +{
>> +    struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
>> +        goto out;
>> +
>> +    list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
>> +        if (nd->sysfs_buf == drvdata->sysfs_buf)
>> +            curr_node = nd;
>> +        else if (!picked_node && nd->is_free && !nd->reading)
>> +            picked_node = nd;
>> +    }
>> +
>> +    if (!curr_node || !picked_node) {
>> +        curr_node = NULL;
>> +        goto out;
>> +    }
>> +
>> +    __tmc_etr_disable_hw(drvdata);
>> +
>> +    /* The switched out buffer is free again once it has been read */
>> +    curr_node->is_free = true;
>> +    curr_node->pos = 0;
>> +    curr_node->reading = true;
>> +    picked_node->is_free = false;
>> +    drvdata->sysfs_buf = picked_node->sysfs_buf;
>> +    drvdata->etr_buf = picked_node->sysfs_buf;
>> +
>> +    tmc_etr_reset_sysfs_buf(drvdata);
> 
> Why are we doing this, when the following __tmc_etr_enable_hw() already 
> does the right thing ?
> 

Sorry I missed the part.

SoC-600 supports save-restore, so the __tmc_etr_enable_hw will program 
the registers properly.

SoC-400 doesnt support save-restore, driver doesnt need reset the pointers.

Everything already done properly when the driver re-start the ETR.

Thanks,
Jie

> Suzuki
> 
> 
>> +    if (__tmc_etr_enable_hw(drvdata))
>> +        dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
>> +out:
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +
>> +    return curr_node;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
>> +
>>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>   {
>>       __tmc_etr_disable_hw(drvdata);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 7c604b9f92e5..30b15c38b080 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -212,12 +212,15 @@ struct tmc_resrv_buf {
>>    * struct etr_buf_node - node of the etr_buf_list
>>    * @sysfs_buf:    Allocated sysfs_buf.
>>    * @is_free:    Indicates whether the buffer is free to choose.
>> + * @reading:    Indicates the buffer attached to the node is being 
>> read by
>> + *        the user.
>>    * @pos:    Offset to the start of the buffer.
>>    * @link:    list_head of the node.
>>    */
>>   struct etr_buf_node {
>>       struct etr_buf        *sysfs_buf;
>>       bool            is_free;
>> +    bool            reading;
>>       loff_t            pos;
>>       struct list_head    link;
>>   };
>> @@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>> coresight_device *csdev,
>>   extern const struct attribute_group coresight_etr_group;
>>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int 
>> num_nodes);
>> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata 
>> *drvdata);
>>   #endif
>>
> 


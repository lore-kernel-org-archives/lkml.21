Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221869;
	b=veAT5l9DJcOVdTQANTEcl8tmrFdIHPu4+wRpSqkmj4G5qRhFJGgSSccuy5F9qAV9oneE
	 9ipQF9H84WePEYMra/gM91wr3KJe8vH+A9ijt+3kaa1XX5oeHTkO47VMtSls/oUWW07G9
	 31/fFVfWsJ6la/RdP44yVm/nOHj0Qv4yF98VNOoLvjuXvBiTmgt4FbrzZPxAzAhqfm7FT
	 M3hO1HEF1AIxJluBRwj2a5yiD0n0np0POVbP6cIHPOW4W9yPF8PVCr2rgp9lHyW30tndE
	 VS3CvMRaNd9sJ1Z3Qx4XmXuKNuL6zK8S4SDXfDdavy3DrxjDdkYTsXELaN8DWhPcJ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
	b=TSNaqeCMc8mstnCarh5zMi0J5o3TQ0fNHLwIM3/3/UIP14T1Ul2BT43PHsSvdITqReN/
	 a03hB2MH3Ti2pi0jVRSZ6SFrVIJTQRF9bD7h8K5NrW78WkkfNzc4jOopP33VvOJcNION2
	 imARwH6qA481r14C2gJqOjb+/zyjuATE9wBtKDyRnGjPiN0QYPvSEdJkTriphN5JYMgqQ
	 RUbSnc4SlD/FUg+J6379xZXZeeXayEmxMkU1rdupKQMW8HkM5mQGEBmQc6+aGT6XJSAsq
	 eaP4Pi/C8uruU3tCAq3VmlSgIyJHGTBT1BUgMWs0naPxCbNSAJytJykc63QdDLIuvJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEXaY4Tg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAG4r1X7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B360606A6AA
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B360606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEXaY4Tg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAG4r1X7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0B1bW3274442
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=; b=QEXaY4TgrqclYeUG
	E4U3L6SY4ofnwsAYJHj/1j44DLSySxjEkq8E10NchzmXvmkdTzi3itIkDLr9BFmg
	DdhPUBwDW3fqkTp+JHB77K7X8PSurKwy9/KdcyQEmcHErDcJYdS40+X0rSSf7ukO
	8WA0y8jtPdTKauky4CIpkQcSqhWTKVE4Bje6FpGzf1qwPipQTPGFdpRmRRI1wIw0
	mS2idhhFwBKArx4g1YVrlssKLd6pl7iSBNoXie+LR6VuNCfrw6+r0HG8VhDm2+yb
	a2k9ieYhV5hLLWXX6uMGmxvdME/vpecVUhBhx2gtJd1X81nM+Nww2fuemP1o330U
	WsIspg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2y298b7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:44:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1609873eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795221857; x=1795826657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
        b=FAG4r1X7F0omf7xzLm/6V2U9a8CJ9xxuHYXocvdbCKF/KvCaeyZxmOBfFro2jhmns8
         BYrjXcTRjipVpXgAbsAroJEr5FFAHqoz0EAoUR8lV9wCoNXsuB5pSNvH+FpPV7RnX9eA
         V3bH3Uet3kymFWSs5CHdmdEZ09bDiYLyW1BAeQG8qFs8SMG6u5ZDxcUGxkmhMUBFWKA+
         JkOTgRqDuvILyWPXgMv5R9MhtzqHQBgDOiTy63guaKGkQ4zRV895HV2rrHa3QBcoYufX
         kwoq3O7/U7S3P5q0D0QZfDctLNWcx0iDNOZAYhJLBIFAIDFjX/Fl6951vsNcLgJL8Yod
         2Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795221857; x=1795826657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
        b=oRrGhhgzfwhcDDBMl0ifPvHRzkHeBN0W3OTD69bo/MUtN5z8DUTCwaIIOngHW0uKLo
         anvv9583bP5dKNXAKZ8EXMuon+kgWrLpL9Bvfak85hkV2O9Mo857EVgd5W8s750YsG1L
         EM6b2E7L8iACccltDbk8ME0ua5uGT9SvNkkCLdqtLE7GRRcBu+95b7I+wFMmmzaFy5wB
         rlbGwXyf6NbjXJIO0Ln/fC+aEFG9eBFMUIkWS2Sh01+DAiFSB+BMhU4gNCicrmtfBf3r
         jgCAiFxFrxF3WHjuEzL0sboZ7GklP3M+sc8HsA8DCLW26PTXvnEoXd3pXGhLbkoGRNqk
         il9A==
X-Forwarded-Encrypted: i=1; AL+hErFYOMbqiHjrGJsjqFztcc43V48igmfZ8zaVGIVs3Kilu6T/pNk19gkpWWtxJ7Ud/HJmoJDCCDf3Pj1rMXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LDLO6D/jD5xUYs0uV73kv8Yg+oOxAkkSOHHlz/XvCeiYErlJ6
	Bp6NqIixq+n68NNaA7VVwjJeC8PdjTFK0AsmBQvyuguAY4uGllNLyRrA/JI2MT0WgndqzS9t6qC
	zxbPfum3U3REkjSMwOE5EfjNjsnbpDaBgS06Le5weT6p/X+YAuPamXWIeeLT9dcQP92Y=
X-Gm-Gg: AZFdTZfbALG2xUwjcgi5uwu7FQheAezJAlr4wSJwq0ZFCFFw0O4PGE0r9axWAo1FYij
	ZAFiSz9o+akrsZ4x9G6g3Zvw9SGAKBelVHpdiLv0xBR40m2+t9yjZdFnJWJOoddV1ZB66PNtdLk
	f+PNubeXuIIFAoMtWdnaV83MkUcDpKIZQ4SRBGIle2tjFykSjDff3+qyqgVhCFnug0kJXfcfCbl
	wB2b/y8NEqWdNDoNEXdVlu6B4yXy7cBPRAOsQeDva4KeZrV7sfaango8u/C/h0CeEd3bpY5Dwnc
	hK/Ojq1jmQeBX/copgDHfR0Gm4jRiYGF6ey94Ru9dbTDVZcQsu0Op8ztudUMdyLhYpybJZU9bF8
	Jm4YfCAQ4P1SXwnrpAFtTz4mAB4fXHJLj2SkL4pYJKodWtminn+JTKITT18vo4tXKIHQTF/dsYb
	i4LO6mOi6t25Rileub6kpYont28VG7yDj+NyXF455X0lxXEYk9DENGtlVE2A==
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr5777404eec.31.1795221856768;
        Fri, 20 Nov 2026 16:44:16 -0800 (PST)
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr5777357eec.31.1795221856211;
        Fri, 20 Nov 2026 16:44:16 -0800 (PST)
Received: from [192.168.1.72] (108-202-119-98.lightspeed.frokca.sbcglobal.net. [108.202.119.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm12974717eec.28.2026.11.20.16.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:44:15 -0800 (PST)
Message-ID: <13d32bf7-7f74-4dc5-a875-671167149df9@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:44:15 -0800
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
Subject: Re: [PATCH RFC 0/4] firmware: arm: Add Platform Fault Detection
 Interface support
To: Ahmed Azeem <ahmed.azeem@arm.com>, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Divin Raj <divin.raj@arm.com>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>, punita@qti.qualcomm.com,
        jonathan.cameron@oss.qualcomm.com
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfX+F/65xNcz6Ag
 IRDUQr4kUMk6D37eVuvXTAHRb8c6flBiX5XmAgmMWUI4gnI56gT0cCeSyDCuvz9OzAsr6GSBTD1
 B93sBSclJGOflLu26XCrYYqYtdaWths=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfX+bZ7JUarVytK
 M8yJVtWcZ3jwNAeNAGC7VFNssbYABEXgO/Kw/eWGlKhJKR1qdDBJ2aenm34h7eqjPDmDKVINdQf
 yBDMkPeX5xQiFofmzsGCKxAyJJDrzJMHUWbHeq5rMfgd07szZCLTNsy10ot6bMvQ1yd/tzNE0OB
 dwxjFS3OocS27yW+tvyq35kKOXSvnhKIG7wdmeGwZS+n1qe7C5JKU36ZGxU31Qc5/CxuIUkmoyr
 hRdmstaP2A/WsuieXpsm9ywDTCYFjsEct71n3tDqfxLyQaH1maiGu+moDqo5MTWpi6h4HTmd0e6
 5ybFdx/qTfOKj8s3S2ZtIeO4ikE0tc9Hsztdev6iRsoE/2WTt7Vyy2rY6mL7cqDRlhG2NCJeoIb
 m/yNgG0niIFP/J9Fw44leQPmvjsy+AZrpMF1AfThIZJeMcM2F98tw3C9ncGbYLkC8axVtikh4cS
 sACvZRJ0RnF59g6WNwg==
X-Proofpoint-GUID: kv4UsiGLEpuV4-uUNP2e54I_DpETY9Bk
X-Proofpoint-ORIG-GUID: kv4UsiGLEpuV4-uUNP2e54I_DpETY9Bk
X-Authority-Analysis: v=2.4 cv=Z/J5j3RA c=1 sm=1 tr=0 ts=6b00e961 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=HIR1veyihGOKDQ4ymPDRgQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9AdMxfjQAAAA:20 a=VwQbUJbxAAAA:8 a=oK97o0Sx6ny3NbBOOE0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1011 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210001

On 11/19/2026 7:36 AM, Ahmed Azeem wrote:
> Hi all,
> 
> This series proposes an arm64 driver for the Arm Platform Fault
> Detection
> Interface (PFDI), providing a common Linux interface for privileged
> userspace to discover and invoke firmware diagnostics.
> 
> We are posting this series as an RFC to seek community feedback on both
> the proposed Linux interface and the underlying firmware specification
> before the specification is finalized. This series and its validation
> use
> the PFDI 1.0 ALP0 specification [1]. The current public revision is PFDI
> 1.0 BET0 [2]. Feedback on the software integration will help identify
> any
> changes needed to align an upstream implementation with the evolving
> specification.
>
 
...

> 
> I would appreciate feedback on the specification's suitability for Linux
> integration, the proposed per-CPU ioctl ABI, the worker and hotplug
> model,
> and whether this belongs under drivers/firmware. In particular, is this
> the right scope for a common PFDI interface, and should error injection
> be exposed separately from normal diagnostic operations?
> 

Thanks for the RFC

I haven't read through the specs or code in great detail, but I thought I would send in my initial thoughts

Most of it comes from my experience developing/up-streaming a similar feature in my prior job at Intel called In Field Scan [1] / [2]. 

I think creating per-cpu threads just for this feature might be an overkill on a system with large core-counts. I think an alternate approach like below might work for this 

1. Drop the per-CPU kthreads and the cpuhp state; run each request on the target CPU when it arrives ... something like
cpus_read_lock();
if (!cpu_online(cpu) 
        ret = -ENODEV;
else
        ret = work_on_cpu(cpu, pfdi_op_fn, &req);   /* or smp_call_on_cpu() */
 cpus_read_unlock();

(IFS used an alternate cpu stopper mechanism as it had the additional responsibility of synchronizing sibling threads and related timing etc ... it might not be needed here )

2. Use one device with the CPU passed in the request, not <numcpu> device nodes. Use a single /dev/pfdi (or /dev/cpu_pfdi) and add a cpu field to each ioctl argument struct. That removes:
- the per-CPU miscdevice and pfdi_dev_data
- the per-CPU register/deregister on hotplug etc

(I will be away next week ...so my responses will be delayed)

[1] https://github.com/torvalds/linux/blob/master/drivers/platform/x86/intel/ifs/ifs.h
[2] https://www.kernel.org/doc/html/latest/arch/x86/ifs.html


Thanks
Jithu

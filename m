Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031878;
	b=Yt03oSqahm3DmsDfN8AxxaTkgn87SCosrZjy9gul8TyG9l6xvKkG3GvKSMhpVpOw4OJ3
	 Rv4TdUmYIhiw4GSNFPH3N6TwWT6WhIHoKAXKiHzPBQP2GzzmTDItGf3Rzht+QRI6ZzmOV
	 LonXUUnN5/Czran+Kzo0Bo+ngCr6/g7VYghvk4L58r1UB/EEgEWYHPkZdg6OhcRMtbmtf
	 jHngtoNqBb/QNxTNJzTQv4CQn1IyC2gFANtTxxH51vn+pzlAhNMIqIbdCS55TL63in6WD
	 I+7Bs4Qu5mSWZ0TBMRLxFky5xPGjEcGwqZurRdXTwQjT+/vqS356+fwD9DsT0RV6FUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
	b=FYVwcrC8ToAUxuUdYs/u5Ad6Jp0OHfawEF1ZUdU2kMFIbzUl8Jq6C8d27sh09uz3uqDm
	 Evi0koSMa/4haOAKEoyXT4w4Id5pY6892ba0X591or8lb+6ZX041/ToY6exwZYF60fcui
	 r5/d36H9s3ARKU1XrZ0Nud3o3ARBL8SWWYwTtFkPwBeEvCeJJiOMAgyoxC2uoUjwQAgM2
	 A8mGNqormR6lJyZkUR50IhyE/cswxJ/Gew5mFr6y6ftZxP+TlPn283w/t1VPeZBnMuK45
	 9bsePJkL+xZ/NX2z7WZynqHbo9kImGNrqxoVV3Mqzbq9zk1iWinE+tK9GtsN0sbcXmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EcNTSF9i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adc2TpIn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECBA606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECBA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EcNTSF9i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adc2TpIn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJOUXC2131151
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=; b=EcNTSF9i2krMzv+F
	gShir+KeEzFFuiKEFVHV//KvBMp2eZ1P046HmDIk0pGXGEnXXaH4ImrrDT2Xvmng
	q5H+01UAj26RLeuK9b89hZeqtM/ckq4e9pcv43CWnL4DfwSfQzSij9QQoTNKUBiP
	gqXiNxo4uY1cH899WIKtN+zAZ294HIF5JAFGcWhfBOdPnx59xFj4MNnNXZ0QLNb8
	wJFEw/cFyvoaVEa8nuTc1AvlerzjHA5RI0rPpzkpJmuhUuVrPla7oDFFqp53GCBC
	D1Dg3ofcdYVwQd06LPJOXI8DR4m92/wnkJPM69+Mp/PPsIneEUuZIPDX0oOfVvVF
	M3jAJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrskvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:57:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso120574eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795031876; x=1795636676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
        b=adc2TpIn4+4hA+mFz5qOAw7zYIozB7SWBGtCvm9B4QWz2pfNa61/lfJs+5Ha6y+S0f
         RUh015ZX8GuPZKf5dUqSfOLNOCPjenOL4O09KDajYbz0VGN5foE3/kIUo4DniK0Pkyw4
         qiMbXataS5nZCGXDh/DS+b922/GN72C81vvN+F7louZEohvQjuusx0BPe34M2ZofLufm
         L9n1/0ySgzxdyS93PQng2XuQh8bOwFSJVDTd5tuPxgZhoq9w25oS7Z3bhhaEdi1Nld9x
         lOLcphgRUdUNgVPdfynGzoRhVw5pnxxc3juactBGj1e95XjUfJ8s2s9pWSHDEKT/LTCj
         lFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031876; x=1795636676;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
        b=0XrFY/8C4i1PDrkVu/eUtKw+inw5jiUSl9cDua7XQjkxrZqAHGTqx1czdCyBtu1Ql2
         blCW6mxDZZPZx0DUe+dl6HCS1JvSM1CREKjYYXCtgnlMlUc0Zm1D0/Y4t9MbJdlsgZLw
         sJshjGg6bhhM0HpjZXYgy/VuZtVv/a7M3JloV25VBjtxwLW6vQVU17951DCe1/yOICUG
         MV/0oZEawoxhJwGMBLQyJ4HtT5N4hzxsznwejzoOnRu4afWz/XWV7YO3+6cZMSRQx9dA
         f5quCmH1dcLKWxCo2M518zVojLAirPrWKn8OsJ/0gQ6j7osXeRhiGb6XPsV5WRWELcLb
         DiFw==
X-Forwarded-Encrypted: i=1; AL+hErGOvy23qBSPEpSZAWTIKIRajLmFrufudtdf+YerIlL6b5IeZcVKW7NwGKgVWfqLrtNvof/gtqFymem3btc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OEuzAlb3YnCtFlvWSjZ+1npHB0tj1pFP5mk7yYrDwkVsKBSpg
	MauE9IkO8/4lJVFghbc77Bue13cF9lduo1w6XVMO+sEZbUCk88elpZrQtNTMLxiOgVR5j5vDgTh
	6fjQsw6sWasFZf7Za2ddmCz2Nd5j/Hp2SWW2usmTw0ccASsJ9sSypc3SKh4CTCcjjQTM=
X-Gm-Gg: AYBFou2UXCKtNNjDxWcNJGHhICRIgDEMHvKnN8HIdSK3PiuyXKDLbsQYkrS/Dbar5No
	LNmPlrhODdP7Uq0bqIImzkSnJZUE90ikeZcTXOuLiHn2xoyqlqwvq3aXGYFFo39IbBJMgsGSn6i
	4n7+8Rxc99HpmTcOezFh8Frn8Xn0W279SjR6JXnpId0A8lGdPSCr6FHhti8MFQaWncEbjG7ZrwR
	TQdhEDMREcPeXAAKyi0mf0YHsv1hAlQ4R65XkN/+rnI5DMLPqwwl1LqFxSJeVAZDTdh3AneqeOU
	hrHx5oVXxDvFwt1ed0iE7OlPpKe8yrD4MwtUuBy9MGWHcnYwJQd5ImSQvius+w15EVm308PxYye
	jTYSWXdpeDHOR+XOgjvHMMQUifICPXnEucdP6RWNrX1tcvI956zfSb2W5cc1JaXgXcX+uPiaE+z
	8helEHb1c91BrsrPdSiMV/I+2OnxiWREK8
X-Received: by 2002:a05:7022:5f0c:b0:1b5:31ed:e23b with SMTP id a92af1059eb24-1b54ca9c6a8mr369130c88.6.1795031875264;
        Wed, 18 Nov 2026 11:57:55 -0800 (PST)
X-Received: by 2002:a05:7022:5f0c:b0:1b5:31ed:e23b with SMTP id a92af1059eb24-1b54ca9c6a8mr369106c88.6.1795031874520;
        Wed, 18 Nov 2026 11:57:54 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm8807761c88.0.2026.11.18.11.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:57:54 -0800 (PST)
Message-ID: <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:57:53 -0800
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
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261101164247.258200-1-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101164247.258200-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXynCxN+19T9Bh
 T1OFSV+czM86TDoy84gntOpJCzY/zxyZgvQSnS/aGahU0IxFVlIg2kvJJ9f8pMGZcbO+sfXXjX5
 jYOcZkPn8Da80bIa4Xl2sZZytvENESXl5BtIhNReZedkjhlGQi9Xk1FNthopfIVWy0ShDSy0a3J
 hZrWXgeOhneVv1Y1MIBu4KcJSCEFOyjrwsQv/8fb/2rDFQYuaQKnwLznhTKkW/aDiHcwUcIfbZZ
 bNgj5aA6CubeGGNX3ter6I55MJAxsVNMhp+RiiVFQQGN7v9U3ZaCaPdXUN5fHD3kqJ8WlkOl8rB
 9O3Ignmhk1UXQFs8N5sTYgVIPkh/lEGnpY070oX/SSIA9C11HuAccKKvu8MUzFW889ySesGZ6h6
 Tp78vyydiBLxUB+OsPzzMc5kPWctz8kLz69/t7aljynz/dxGySzfIV1LHijVyc9LGc7x75HkmkN
 BiKo7nL1k3Hh1o8C82A==
X-Proofpoint-GUID: lwsmf-9TRJuwBKT9e5jMDkwkcMC1hIlE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX1qQynRevnGpr
 iBZ0ROa4Tii4RtzN8+rOnd2x+1c2IwOicTRH46ZOCkc0kbwS0m1Ii+/HRzQJTycGUiNqUevHjIO
 t+k4QPfj5+V4PzFOP6ULECjIlR/6RdE=
X-Proofpoint-ORIG-GUID: lwsmf-9TRJuwBKT9e5jMDkwkcMC1hIlE
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afe0344 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=83aLgFwHvIm-plu-MQsA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On 11/1/2026 8:42 AM, Julius Bairaktaris wrote:
> The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
> Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
> Message Capable 3) and, when granted all of them, raises the firmware
> interrupt and each copy engine on its own vector, the layout ath10k
> used until commit cfe9011a05a8 ("ath10k: remove MSI range support").
> Since then ath10k asks for one vector, so all its copy engine
> interrupts and the NAPI they schedule run on one CPU.
> 
> Ask for as many MSI vectors as the device offers and spread them over
> the CPUs, starting each further device on the next CPU. Every vector
> keeps the shared handler, which schedules the NAPI that services all
> copy engines, so the copy engine to vector mapping does not matter for
> correctness. With one vector nothing changes.
> 
> On the AX3600, with a station uploading 87-88 Mbit/s over the QCA9889,
> the HTT copy engine raised 36891-37590 interrupts in 14 s on vector 6
> and the WMI and HTC ones 165-313 each on vectors 2-4. The receive
> softirq moved from CPU0 (21-25%) to CPU2 (21-35%), with CPU0 at 1-3%.
> Measured with idle-priority spinners, the CPU time of the whole system
> stayed within the run-to-run spread: 25-42% of four CPUs against 22-34%
> uploading, 14-35% against 10-37% downloading (3 runs each). A firmware
> crash forced through debugfs recovered as without the change.
> 
> Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>

I'm concerned that you are taking an approach to benefit routers which can
actually harm mobile clients (which want to minimize the number of CPU cores
in use to reduce power consumption). I'm very hesitant to consider a series
for upstream that could be detrimental to mobile devices.

This looks like something that should stay within OpenWrt, which is focused on
the AP, and not come upstream where we have to treat mobile devices nicely.

/jeff


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459347;
	b=SbusQT6PrDXHsCT1+/d4rgBbx5NE4QZez4wv+GXSqMnBIHhGmf0l2GKs7MRS33bTN6ij
	 TtmMzLWjNJwo00h5tlVzT6uAkOOly46667olSQpxoEAdg0EKIzhP6K7ErDvRVH4GpTX1q
	 U1/o9MM3qiINViAzeNdpq2zs8OMTpCMeU71z0M2uzjd424hnbwUH7kniLhT1iBWAiIQhH
	 2rrEEOAltbo5mIFPtye+DLa/acTBgqZ9r/5NEwoudf4acKHpvKm0RoHuT+1cmFP9zKtyG
	 TeBUw3AfAchbM7gn334zePIWT/iml/23BBvYGT1eJXEbyYvaThyV8MR3fwSQtzch8Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=;
	b=O/ENnD6oBZVZTdHzei4ciKgvf32EDBua5s4ngOKhcPmCgUu8hn1XKvgNSRKxuHBAPDDS
	 SsLyha2JDDAVvZFFM40zkFnVSs/RmbQP+NIxDAeuM7mrIT78zYPn79C2fKYAGRyvMsHup
	 zNZTVRObRJTG+NI8LisMdycdltWsfdnKsFLIx3rLiF+8chRa8JCVkv8X+SaBSdgjmyuuu
	 nD3LNcsKOdgSx6/cIccGG7R28AsnNoyFHlmMHat3JDtEw9hiLkkXLVYfuGI1s7vSyzRWT
	 tApj2KDVS0ifSzMOk+uIfJKAa0h420+rj3rfoyexwMuQqBXM2L3goaxBIyd0x8u5Szg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QiJ3W1z8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Et6422oq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F67606A686
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F67606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QiJ3W1z8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Et6422oq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnGi3730225
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=; b=QiJ3W1z8ipaC9yb8
	z+jPkEFJl4FmS5tqfd3vTQH6B3QSy29PgKQRCRHd3WAeHcLDi5MSMBuwO+CvFEOW
	35HUh3WXLHHKz1lKqXVZBGTbHkvhnTFV/R2OV7wSVKegsGThWRRmT1QV8UNF1jxo
	Maq/haq3HHMtwjcUNEJL8aFwe3xEjjueD44rfOmI6gwkP7zOX9PIcn08hLhWixls
	DGPb+Lk2yRu4vrBwnBpCFy8P1FZ4mqZ4uNsZA6aJe9XWwarO7rdpgbuYM1TZyzsq
	JhgMQvm+MCafXx85m8OJT24e0OMD4q+ia2x2PHs1mvfpZcLvxeanC6tAsko85HDj
	2ibgnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2yg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:42:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso40887785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459346; x=1796064146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=;
        b=Et6422oq8Ece88AGKwqHCIDH9qsSn1FOQpoIE+wQhbUeikPSQa1HvQlbyeMjs/Cz/l
         xp+9hwlVBQP9YhgeKV5KSnoA3KVEZq0PNuP3cJFeqAnwbsKhdZm5h6sBCIsbIWydPvHC
         ry2JZNNtwHfuYRGuQuS9jAoHe5RO2oX1oxYZJa4EsafHb5VyA4Ly3C6l+Jq7pviFcEXb
         6opB6XlXZOhKqMaKiffCQtKg3i7ZZ/AgSRfUeln5TUWpgg2htNf2lx24pyh7REwpUhmP
         SCL1m/eea/urqKCpmN4321MjicrE8h1duDz0BSp0fK8zQjAMbULpuaVaEpNnSBf/ibTQ
         GSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459346; x=1796064146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=;
        b=zqtROgf7DgTUe/Vpj4/NjN6oY+A+XGewtJ12Fegvw2VsIIVQnOMRhZS+rj3RLSup1e
         chZqeEK0vGMaAu+3EVVGQg917sa7boa3PSjF9jDsegSsDadVVQD7duR6lfsIH6ABu8L7
         2+TdQX+igQsWrqbI3J32wCqMt+qv/WpbIKUMfIH7LMDeOgEV5ybSinKHG9bU/akJ5BEt
         1rI6kG3VekFf2km6HFJdH3X1GfrIHSGpvW8ehnLCd2N/RTV0BQaXotH2DVbtAKTJAAOs
         ock1d1GgxH5D2ILal+GUQ715Rhf9eMPvKURvMs+qvpxlgnGOcQnbAPl9YF895Ky8oQY4
         AnAg==
X-Forwarded-Encrypted: i=1; AL+hErGKsAi89Mfrkbo5UGJ2cKISGyB4Hm0XEi/m3nELrif7gV2Va+3eJ4uKZ9wr6ZuTu0yeqFDlQo04idaYdfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qbgzd1nDAOSqQQRVRd3xDYjZaRvquShzamTxl5L4kUkjP/kof
	8RshMYa94scFXcqLpH/cdnxpHqGay2VJ5toy7haDw0hT9Y0n5dHTN2ZNJ4Cc17ZmRyH6fQ0udQj
	a9QfagisiWddGiw9xCvWuHNKtY8eoer36yg8GTgPO+XAHmVJN/DiWv902+bVuFXVOdqE=
X-Gm-Gg: AZFdTZcXr290w/0BNeUE4S+CxVsu9UXoHoBgYDw7IvY9tnr8c1Oq/VsPp2C17pxlgoD
	vlLr6YQ0Lp+piFshc2vx/lt0rk8TLr5NVVXkgYXji0SQJ7PM9OI1H+UsQnnndxFSHpGoeZaofGD
	kGhZL4DcdtbP/5++jp2WI5LNVm4TPpIipLygatyIZPvJooO4WDS2oRO0xE/juDdRgs+Ud1bq9yC
	25FioRn2vaq3EvSPtS5XnQgPKOW2WpCKPVZJX4zvIyBnjW4nVrnFSpzO0MTzavZobNidWYJfweA
	8GSsU48k27Nhkj/gWPAhszaAXJy2UM6U4tbHsts27s5L2uyiBdbnIYuLK3ND6mRHvCNmRyy3KfR
	h6mvM/E69K+/zgQu9SJV/IzmSaoVqjTAiYimTWPcawtJD4daW2SBq29ioVAnOEnT4mE9f7Fk=
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr2043698585a.2.1795459345461;
        Mon, 23 Nov 2026 10:42:25 -0800 (PST)
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr2043694685a.2.1795459344926;
        Mon, 23 Nov 2026 10:42:24 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm434564566b.80.2026.11.23.10.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:42:24 -0800 (PST)
Message-ID: <b11d2e6b-8802-4450-8eb1-7984034d5c4e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 19:42:22 +0100
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
Subject: Re: [PATCH v2] interconnect: qcom: bcm-voter: Clear the ALC vote left
 by the bootloader
To: Michael Auer <mick@yoxcu.de>, Georgi Djakov <djakov@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Ard Biesheuvel
 <ardb@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120122152.198114-1-mick@yoxcu.de>
 <6e30e65c-3fa7-409c-90da-2740f7bf0a24@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6e30e65c-3fa7-409c-90da-2740f7bf0a24@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k84yLKkhjgXj37P5C4FeQ3UDXO6-F5hg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX71fIUopCwK1a
 7TKyBsjCDtfMH34XZjc+ZT4t8jOzGqaoIh2MuvIwdQ3MtaWuWlfMDJlMSwSb08de/hwiYRa0FnY
 0OrOXFOzfeViJf0D7wgaIKreHPFgJ/ymmg+lK4Gx6+09tfHp56piEBwneFxJ9HCHSyfjoufa0IN
 T7tGoyz2KhwkiEGaqhAmscxYBa/UinPpA4167CBFjxUjy++4WoHQnve3ZvH1S7cR57ohpQt1Cgx
 x55WegkDGSo1GJMUvw6yNZO9RCLWkZddeooMG2ql52lmYsA/eaNYQR8/0onFnD0KA11jj47m+XU
 jtbssSpCmReJbq0eL2hmtCKfD4DahPbnsJFFqFOZZh51uTgo+vk3dnl04T4KWA/2zUQIG/AlJFI
 bs0oDv303MabehzKum5C+mMj8o/DYtoDUvD6fV+En0y2/RvL3m1o6sf2pq4jp8FCCLk0sV8BYKp
 djYN9peAi+2HI3bUEIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX8ZC+tiKimH7b
 AwVFJE5671dCvNrYK4u/WwQzLCtmWxHR+Yi/cvVUwz9YG6Ji2ZFupFVvEzZ7kfQk2E6jVEK7D1F
 Sk1BXrq75MgXgv1IWv5GdmltQZBvRHo=
X-Proofpoint-GUID: k84yLKkhjgXj37P5C4FeQ3UDXO6-F5hg
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b048912 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=BCpp76bnSYiX9KVaSk0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074

On 11/20/26 10:41 PM, Michael Auer wrote:
> Hi,
> 
> A sashiko review of this patch found that the wake and sleep writes
> never reach the hardware. rpmh only caches them, the (0, 0) wake write
> replaces the (12, 0) wake value from the active-only write, and
> rpmh_flush() skips entries with equal sleep and wake values.
> 
> That matches the OnePlus 6: the rpmh cache has ALC at sleep 0 and
> wake 0, and the APPS DRV vote read back after a night with 139
> suspends is still 0x20030000, so (12, 0). What I tested is the
> active-only (12, 0) vote alone, held through suspend, and with it the
> SoC reaches CX collapse.

I was hoping you would test my suggestion before sending it out..

> Konrad, did you mean ALC to drop to (0, 0) in sleep? Then the wake
> write has to go, so that rpmh_flush() programs both sets. I can test
> that. If the active vote is enough, I would drop the wake and sleep
> writes in v3, so the code does what was tested.

My agent suggests that changing this to use rpmh_write_batch() as
these aren't cached and should achieve the desired outcome, please
explore that

Konrad

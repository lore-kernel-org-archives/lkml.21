Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602651;
	b=sGmxZ/K4QGLJpNqpQbepgzq/Z78PlpYJ7PNZiCYPlCWBPX2UtPo/ElD0dBPFojapsR04
	 T7y/0UcjFS0UuIojRDF5Pl4q1VZbNvRoi7W82CIjvHRWlsEK0+E/UxT8c/CZm1KcfV2ZG
	 j2yDHzc9ysCYxU5FVUB6EuQTQ09lFFbjQd9rZ+cd03ABrDZsaWiTAjTU8s6MhqXApkdPd
	 wNblqdRArJD/YZqEwo76WfstgjckCYiy1ed3L/BUKCo7V7JCzGTU3ToKt79HJ7BeGZdJz
	 FXjMKJjM2nLZ+Gx5d3t8NUxp7maLQbnyWUsV+ahDfo0t6lB5tCvMl781MfAnjuZgodg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
	b=Y0Y4kzVGLzOrWgtG9dBDpC/dOX9bA3UclNmwxni2avNXw6z6odo5ZL9b9Ic8kt7atTHo
	 e01irpQwoLI11HdNV8K7AK1nlT5cqz7z6gCnKJkekDLOouGunLCvrfB9nsePY3hS+aEYd
	 P6uOk2W4Q0pLB3Hb8Wfzlvwax75bPJZfWAtz0HcX4uGkr1tExlYv6v8qBeJhjdQl8pUul
	 9zZkRyxOHVPA5KuVO2koqrlCOYGnb1dGO5wAEXfXtK0bjdYGVyV8cNOBBH9T6uXuy7PVm
	 O2jnXC2jJ3haDOb2o3gL54AkMfolOlAc5t1jhn0SmTKPXeCnM49Pfmr2k5vZU5geKTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hfbd/6p+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CH5H8X/4";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA8606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfbd/6p+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CH5H8X/4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nnUH1505301
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=; b=hfbd/6p+NLV5Xds1
	S80CYesJCHgqcIGqbf7yj2y4Ri0FQ+QUOhYlkOC+1NBMvz//PG6BhZfQor+AcE7J
	uRi9VsKRNw+ust46DIQXj3UTlM3oTxKYSwpq+NuaXyI+7HNIbWGE69VO26PPT9y1
	4H+h5diw9LZeeA2aEbFm9aV6gq6e4cWKgI1WDvjAzOEhZbGhpIeEPNjC4Bb0EO6q
	BWZvVLz0gyiiWaslPlCv/xee+MZJtYAUgxi4SfeF2BgYb0GXuFPOkL9YiyNc7DIK
	FzlhYuYTt4VdgR0m3lsthPeIZ2UYB9CPgfGEaghfif58GPRhTfa8B8v/B4bGSvM/
	POAXbw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29rf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:30:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55cbd8c22b1so8446621cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602649; x=1796207449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=CH5H8X/4SQqqiJOV0b1l0m6sYWtf4rfL6obgL+UmJWECxweOYJgqQERBl/o64qvDqx
         IZa1VbEP7QPyungArPawYkNRr9Z3+CKBrLDP7CCzUhUgXsqZxwmHKWy+NzrjnXdjGfLt
         GSBx+Va3Qd5xXWp2aHr57foMRHJLeKug+GGVQyjBKeH44QexVsQYHcfibYTer8BnRvW6
         MYnKpS2Y094wUKRUfRDcD6Aq1Op81/NJlkSz8ByX0R1O6zHDqWCpIqyjAIhQ2o69aurA
         zwBRNm3mfZm8IRY4bUXcDKhaMvEaQ/xunrjqMeDY26mXz6r73VUOQfzb1/S2ygSXwQAj
         Yuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602649; x=1796207449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=DaLCfSEYeVOMOA0A2YXVzyO3sfuNWIqS0OoG7nMtLQmNJbhFVvwOccMd9/4tEI0s74
         wSrGgm2/73BqG6bQ1OwRMzs1gQCic29mEuQrdZ+hyOuu+gGJ/VU1x1Foc+puTNok6jv6
         r86GwX20L/eW9Ihsv2J1EB43pcKB2iKzDUAh1CKQuAWQTx/gmSFS1E7jOmpQineq7Gy2
         QwXjeEcoCQYKemVk2JKJA+406ZRUQGFbSHg/GYWwGkWBHxwqfF2VzfweKfSc4M1cnjzo
         tZKjkM2b/Xh5IIFAwjkVaALxnBhT4qki4CwdhCkXlbVw6iOrlW4JRjdwdOmO6SnTm+ua
         EoLQ==
X-Forwarded-Encrypted: i=1; AL+hErFtueDKYbDVhh859A/dwOiDzStfbdOYKm8bk3pHaxau5xlKvUDlFSmnZ9fwwfDQpZH8Jwm+N0gnxYL662E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZgBWs1z3KjPsoSGVug7gPZSBBd/HTPa1FOxN4m/eO2cDJT4Re
	Ngy2z2oYDBxV6mtgpvGYPCgPfwVVG705KcULhp+MBJYhm2SQUzNrfzyQDPZ3407sTF0p5sTbus3
	91nEnZ8NyrIq8khbH3Vtqb6PADhCWQwg2S6rMUAX2nyfv6PWle+YpnfRbChe0iVFvLoc=
X-Gm-Gg: AZFdTZeRhcFRpPJhnQPq35xTNs0xRq33ac8tVj1g3IUk+xDZ27rX8SW5IN1FOrfq2Yp
	oiZxeYjYAsc38hjDACTIwIZZfkSzUs2YtO9JZV2SnEvSlHb4+LinfXtkQULlKpvWTmrXwuIs4E7
	cz6zUM24atMECCWu+xGrNKht41PkqrmnsnED6sjRIwkluZhDrVzvGOn9G8aoJwnNPM1Z0N4ZveU
	2lGC2ivezxKuRvsGFghfmrhWNc5szZ/rsOWIa53Gir/3kGsOJjysS/Hj6mC7m2L5ZDXxYDn94dn
	MiEq5+GBEQpbzRBkyZe/hI9k1Yo394yyfVSHWL2Iig7HrWQIjz3EVyx/NWdqQlCt50m6dDauLPv
	w8GuRkQYEmtz3zmhzWizKiC5DWeYh5Y/NRsQ7IryLM9JiOfuXX43YkLxZIF1EW5t34qLmokc=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293213951cf.3.1795602648870;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293213541cf.3.1795602648401;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm611728366b.77.2026.11.25.02.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:30:47 -0800 (PST)
Message-ID: <9ab9503d-1668-401c-8d56-632bac5d82ff@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:30:45 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
 <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
 <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EelpmT05VBw6MzWzGNaitJf7pgDzSKq2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX6U/J50USnPkg
 IFlz0E1VLBBDW7RrUDAy1rRe28O906ifSp8sdpJNu4DXcXhVF1TgENneRIjhdWp2/E+P8i0NtIV
 Gt3/Hwfu1S/uvR/io6QxXTkBAym6Y/g=
X-Proofpoint-GUID: EelpmT05VBw6MzWzGNaitJf7pgDzSKq2
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06b8d9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=D7e9McI_jBWpmMXics4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX3XZI1+EqtLiz
 DjpyPcqCkIHkRby98TbfJ/uJlWNjaBOzNeu5GHoNuF5lT4RPEVIl9cKYzKnWvxayzFkqvmt5xCK
 N+L7CfFb2uvHG8wcP/ktGeNz4jbYNZPe8d7ID/Gx5hzOpwGY4eDsXfvxKR8nRyHSazfNNOStG5P
 MmgHkQWJCYa/Shj7EumSkHUnG3KHVU69WSpbQJjGx+M9kqWHu+TLa1fxXk58dysk7Eq1noy1WE1
 1QXbLpsPIBdtlY2Cn+fVWUVz5/DsjAcnxCUalbpqDOKx5FuIRWl54TOe0rFhoeU6JU+by4YKTgj
 ji5IjKh2Acsm/X6UNMc/gmRPJanlzurnp+LGZIJOocug+adAUx4xuApXxqc/h1n8UUyBromnxjR
 ZJ5tYU+qIjSEcN/MI+UvC+JhvoLG9nDrxmalKMOcGfOIGPP+cxWuUStrPLfqVXjBMvB47gd0TmF
 8bNcfJpHBFUAYdt11Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On 11/25/26 11:11 AM, Jie Gan wrote:
> 
> 
> On 11/25/2026 5:53 PM, Konrad Dybcio wrote:
>> On 11/16/26 12:03 PM, Jie Gan wrote:
>>> The cti_riscv device is suspected to have a clock vote issue on the
>>> KVM enabled path, which causes the device to crash during bootup. Mark
>>> the node with status = "fail" for now to avoid the crash.
>>>
>>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> That would mean Gunyah is enabling some clock that the TZ itself isn't,
>> which would be solveable through a clock driver patch. Do we have more
>> details here?
>>
> 
> We are currently debugging this issue. What we have found so far is that the RISC-V core is not powered on when the AMBA bus attempts to read the PID from the device registers, which causes the system to crash.
> 
> Normally, the RISC-V core is powered on by remoteproc much later in the boot sequence. However, we have not observed this issue with either the UEFI or ABL boot stack.
> 
> One possibility is that the RISC-V core is powered on during UEFI or ABL and remains powered on when control is handed over to the kernel.

As a workaround for now:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

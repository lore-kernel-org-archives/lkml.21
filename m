Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163733;
	b=vqVjw+t7pZ+ZP5/QQxt9JVm30C756FWXkXdGiBlSAn+VB+wpJqgvHFdpdDEYSK9Z9RDn
	 xVPL2LFYE1BlL+t5HLW6D2HA0k7VRhDFVkk+um8RZt6qQSA2aYwSCBSghNitad3uV6emW
	 /TdEvlBoFHh0o5wpOHApYGqJDEAapI4YudM7NH2wUVKbpgJVGXg4TjTWEmBSK6r/Gnh+h
	 faPnCF/eIc0NLOzn9O6ehr5BH2n5T32nMEvdSs0PYmudsi2gHkW5QXTR86YK8XLuDbfWE
	 WmsUdZDYRgIn0RAyyqF+kJc/n4SZVGAzsJBa5fBnwIdXq4QG8LlVacifggqir3vZRjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
	b=FSuXRkJGh5cZ5yVV+UZLIi8lz8Fsr4QolvoB3dqeOAeqflDG88diySvs93z0ZuV24FOA
	 EWPLW4EFdRlZwkbi9wPwYxPyJd1yCMaWEZud0+HaJdoTFWLF6HJSeZ3B7Nn1vvEt66R/O
	 v5DdMBvpwuARUchPk9jXRPO2zCQfhS6bBto3nBRX/DrDCmadKIwfB4q8DX+/ZSPiOJvnE
	 cLI3Rq7qJuslRula5yHdRVPhwbSiQySFcJBbneQcQyLFAkfr2OFPirDnK/8egOge0SwVg
	 psieOjXZgkmittokC/4FbnSchWsW/tcwER9uyA5ipVHQfxmwW7ovi3DWqNc5O/O7ufA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NZmEE/Xx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amV4y0AS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CDE606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22CDE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZmEE/Xx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amV4y0AS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0pR1742016
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hBY5wVTqJ0IzIgFA/9FEwfwp
	YhXNkAYQbs4g4C/IQNg=; b=NZmEE/XxcPjqXuV5CWFQxRpFNKE5Jr10PfurHbgU
	FkVtmFV5oC2/TEqkyHAC9uacgbHh/U4gMIyBInbpDvbGxE7Fid4GxDjTDxlfdwn+
	sbaUa6uKJf65NsCo+ldpcI2Rrmxu18X6mzxbpcpjqOu2jEgmicgVkmFViNyinNf4
	Ja4ek4DWVwvopZzZA++XTY6q4ldMaQAkHnz0IMR0iCfkMRtAbQgDnerHGpD7dxjP
	7XnahJra3byw2uWD72RvpwDS6F9s4AFcdv7ApjQ5OqsY0ASKBJphlDt3D3bmXQRl
	Y6N4V0f4gzDoOmjep1s/K9FH50bTHk/fRNWHUJqQFf3PHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygx9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:35:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso155714085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163730; x=1795768530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
        b=amV4y0ASfS35BwlYJQE6/A7xxWoWhZOUitXbA9gtgENnAYfrwzxj4JZqqwQf5d7nnD
         Dj6dwh/bdlXVMkvzEAtxKbidxvBbbO1JNtOPa0nUvj9o7Ip4C0s4FPT7BYOJel2+cWOv
         yng6nFGD3ZkAb1FsUW7wjW3gOOPZCv9AaYsLVAw+kzZkmYy+1MN9v+QKhgUVTpwcbw+S
         gBgJ9wojqeSU5bWY6GNckJ4XwVNRkBJMd/gDJpiaS5B3Gu7gRosf6uPbFlMV0Nxd345L
         emPKwpIgtQ/OLQnwfuWCCo30q2fxPGC8nwP1VEE0H+4xjZxFT57NZklQAnSsRud+0vmn
         +yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163730; x=1795768530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
        b=CvV4DwHDltw7AqDeA9O1nH2BULVZOHbTKBmV0RENIIKfz8kbtsj0D/CsM7GeJaoIrp
         kjl3r7MhN6O4Mk5UPc24YSOLGD5kZbLnae4AzRyAfcL5WEkGet9jz/mTlsygKL3FsbsU
         4FlVkCRkYezHyEALWNDN50hA1IHPkEUx/EfbjOWV7gNiSUqoALleNvsCaaPqYX0eNmd3
         SW1wZKNM159dSw++fada2Y9ULeWQ4vu3q7zk6zA+AMXY7+Vunv7OSqapHhTQoIP6QM/Y
         wmDJuoH4vU/TISxJbc1l7LhpID8demKgEynb4YrRlRfC8gMaaqBXCnu3fIHe5VZfG+Og
         G74A==
X-Forwarded-Encrypted: i=1; AL+hErEppra7/bWV1Q32/O6PXruTOhNm3qzsGyVElbP4PYvvwP+c/YeX/Fh9GPxJAbIeS18GobJsSEb0rNR1ZwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lKrdaE8FJY+CHo3jn7ln30nv9L1pfvHVfnYq7KYcFbfXrxv2f
	fON+Vr5T+YJgbxqGvy9Y0hLENuUC1Ybw/TcRguL4uS0q5ktVz6oUn+fELM4tOvinjhlDnRd9Nfh
	//ifYpuSTee0sRTl71a/Z/sg+0/pGqOFmj+YSpfVFnPmHnyQa+Ffb6t25xG92hNnQ0FY=
X-Gm-Gg: AYBFou2gVPur5ZZ1j67Ejn7x7w+9GkkLdBMzCGHIL8vLnn/xW8GHBAd6BsZXFN0ob/3
	jSWxhuM/ILxyfbB1YPEE56KxXXXgKQt53QB/y5kUFfxQYolnMqZoJQP1K+q551X52NHN3ks3Pgm
	A2ebWwhPni9N82ThWuDUwsIToeaTekRw/AMff+uJSXOLhMXsXMom6ulUp/2MUF6PtFtMmsyA0Hd
	3YH9D9UWUg4RGnBnXVdAkn2B95JMBuPxEDuZGUp2DHCBEwpMgaZuDbASAaLJ1hs8+Lwum/o1hsf
	nYtQd5y0UPjBhjjaEBWdTzHnlGA94O75y0UrYN9swtx7AG6cFUR6rUY5d+CfE4Hv50Fk+6pgoyR
	PRgvzc3WL01iV97kn6w0O6Ew5n3jT5xnYAZQa6m7LkKzQq7d7WbJrwZC0YnhbH8X+
X-Received: by 2002:a05:620a:4443:b0:949:7118:47e3 with SMTP id af79cd13be357-949bab4d96fmr378868685a.58.1795163730202;
        Fri, 20 Nov 2026 00:35:30 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:7118:47e3 with SMTP id af79cd13be357-949bab4d96fmr378864785a.58.1795163729507;
        Fri, 20 Nov 2026 00:35:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm3967531f8f.42.2026.11.20.00.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:35:28 -0800 (PST)
Date: Fri, 20 Nov 2026 10:35:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Message-ID: <infkyto252rc2ocolww4ihjuptd5xg5qcjtkft7gpyssxhp234@4dnragxtdfxm>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b000653 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=YOuP2q-gqnfq9OsU_fgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXzvfROQBsC95Q
 eYll6G0vTpkeMc1X1kgZQqLjtoMwrqo+1uR0n6xtY/aK8ib6CNvklnswlEBaIX2Sad81xdYWYE9
 Wub3ctlaBdUm9odP0bzddhyqH9WOHrtxB77noQ7f5QKHP9jcv8DaW3vx3S660H4Vh2liHjH7jGU
 GDSFIxpznyxAqA1zuELNIzn/xHc9WZ/sjfsDbdgHA7c69Pfdm4uIcy3u/NCjgQ4IgpKaobzf7yI
 rL7SqOaG/K/G1rmnX0ypyg3AdVt1p0n11oxb07/btM5wzibSpwtEg10Z8yuRE6QW1nQEUdM7oL2
 KZBqtHL+4YX4F57kGgAojMYCQ9UDkAIT2HWcu6EyqiTQo4UhKvEGvS8m5DlJVcbR7JlwfShDm8J
 zVb2sgDCgaxuOoR6FyaxIxE1tiHD8O1ozVGE+LReVSJtMhSnbIZM+oVHgzC/NjGSzgimjnvea/z
 WcK13wisYoWHXQGVBpQ==
X-Proofpoint-GUID: jWzujuzhP1Xf0h60eVkTxK8TFBRsFsfQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX1X1OQHfxugcw
 /22SPKigAiKcJuAgaAUfHDzk8z0Os3isWNggElQSWogkhCoKXUs6FU3pQezarXgWFThawa51y2U
 2jlc2loivCrnq9ixf2+LwY7ShEZt4P4=
X-Proofpoint-ORIG-GUID: jWzujuzhP1Xf0h60eVkTxK8TFBRsFsfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200033

On 26-11-19 10:51:25, Griffin Kroah-Hartman wrote:
> Update the node for the DW9800K for correctness.
> 
> Now we correctly select SAC3 mode and enable timing-control with the newly
> updated device tree bindings.
> 
> This is a breaking change for a part that was previously functioning,
> but only due to manual register writes in the driver. Now that we have
> the correct documentation we are able to update everything to ensure
> functionality with other devices using this part.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

With Fixes tag addeed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

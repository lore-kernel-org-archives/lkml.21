Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811599;
	b=JwlzyClD4gD6nA7sN9KXy8tDRWz/Gq8gyVzog7r360nutCjiQJOBpj1fKwyPV2uU2IVQ
	 V4gq7i+nxgTX6rsGiqdlROYlEgHbu1CKpKoainNLtUl/4f0jIap9ZaUeItiHD7Zufuqin
	 Km5cfriOkrdZ0eez5cGfTBCO5ipgESTZbCokdcSFrft8oiSsG8wulZowyS1gcpuOl5iOk
	 DgrGmv3idIKpYU+JV6ujqw+gemA/mh73R3M+QrQL4maI+1GZxiw+nJJXYZS1X+Sb5/HVv
	 S08xrLC1qmYvVBx816DafD9wxUx+r2O9I7+OhYLuTEKgzxidAu3z9YoV1DdZmJ2gCnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
	b=TBTe0bYyP86tNCYdf0Cj7VXVUbZlydALkIgNB6W/31y/Cs/Zzh+yC/sDY3NHmPE6389Y
	 TqN44WcRE9Q1oKFbfxc6Cg0rKpHVE42kj8Jd/CmCM1bCccIKxjpeupCmCz5+THx01Pggg
	 vUmHSubnnCLiKKP1GhGK3F2K9ySTlRZ1KWPyGPnEnN8sXsGnQhclHnW8SWjBynwh3ZcR/
	 licyvVYdAQ32L42YHfqDCKiLPuFkQosHrd6x7wUQ8HI+9YVX1jozwRBLj7yVVUynvRo/R
	 sIzLIeKzoWevFWOg5QmB/Bb6yJ4S0b2uIhKDLhK6OC/dRycPyQa5/AqYaZtyMKtKPNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VRCEiFxQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfLkCp1T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63803606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63803606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VRCEiFxQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfLkCp1T
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAr042127747
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=; b=VRCEiFxQxoYOSGdH
	G3uZ1VEiry+ezdUhDv2m1BlPtGH4U79T9/SHHUFOfYsJDMGEbycdFMgqrAbXdSzb
	jsR3KkUidJCi7snQ570dZAFH8G0kVtGh0RWZgMLWJj2CVqt+KgEtXE+OzCD373Pd
	R4ukBCHKd7AJSUsrYqE8+c3odSq7DdcVSwtl9IapAe0BAwSW+diXP+aZ+g6jyb4/
	+ozGPES8mvhWFqcW5bdAe5dLa2SIZ7kLIgY3p2UaPquUyah9a9AtEy1t/AG5VDJx
	n4HFlryr6rs3VgQF0o4GsvUf/SSq7vfLoHZoQUQvsOtGrWRzRbGhBsTicNeFwGsu
	SMQmOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e7d0ef7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso1380441485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811597; x=1796416397; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
        b=RfLkCp1TPpuIe3mQB5c6pfZU1UfiQtjEWEYHA/KUkBytAmjHX9U+JyVS/ju6Q2YQTI
         v17gHESlMBMZppfDQa2CvFdodYKo93lew03ThnOOsesuWH180UQYJQ9NoPKnsZLEGUVb
         LKtXeni2dlsZCi2/M/KR8wxzQaO1LrzffNfbCq6MmelniP2tNSpgt7a8z+GEd4QVcycS
         l1U/IR26xDCy75flcmkI8oWnsD2VEDdpm1p1Ao2G/TVzDxjf49n4kR2MGnZDwU6Trhy0
         KVMxqIXFUQLHVRiw/Hy5pN6a2dykXSL7xcCP/CCIJaO0Z3Ix9iC1ufvxgWFdqhptYFaL
         VgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811597; x=1796416397;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
        b=TbOFA5y6/gU7gEzNjnkVqLJ6HODv8LRYCCRkT442KHjbp3Ltr38HzV3TASRkRBlPBl
         lX/wo2u4cgC7P0RshV8dKKRn3PUyBdPM6Fc7P6cYFQKrSsYMLF+2v/QagNodRqDYw7zC
         1eZq1fXig0GrQdiTHX2h4ixLTXI/jYSVIBWwVw1B2z9gbUYpSsWjbA29Bx1bIGFglsSJ
         6QhF6qVrnmv3/Hyeq/WUqSQaZFjLLYaIU5ZvKCLqB8ML9+o3Le/bVHcANUGSGHqmzMSB
         PsNzZbMYf70NrY0c4i3gMAQfpY696cKxnT0kA2cv01xQ+8Qwtz6F77rtVezf+iFxOGzw
         EomA==
X-Forwarded-Encrypted: i=1; AL+hErHFwa3fm692J3+KkkI2DJrEIAaMq0YWwnEny3WBBv0+0FB2+JlNaye1zr9AoCDj7b+5lLMf726iqLcIE/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9BUwF+Jh4uL5OrU7fPjMslW2dyKSgaQNumjr5ZQCQqaA+Wcmi
	WcLI7HA9AShs2trAlc2iYf9fq8djAqFrXD7X0vI+OiUCvgN6UKah+7YiyuMX0ypmA0H5XBmFbje
	OPUSj8D26EfNkOVp0RnV4GQPTf08hwXkSXGFTweH9HzmKovWZyYVR/Ix2yj7UvbGj19xohknWr8
	un1w==
X-Gm-Gg: AZFdTZeWwzIrLWnidUz/vli08sNTwYZqB3mX6zkEBCIc8nc326UmhTHb7fO5Z7rpDvy
	NHAI8w5Jaxto0kbp+qtu5Sie7LdZ+KBJC0Yv9nvcwrAcubpvkVuM2zwZBPpAhkUjYQDMwvUeIwN
	sG1Bsbvtc/LA8XbrxDZ2FTwlW3u1HDqkclKsc/OC/jhMVKUXndkAUpxfBB3ZrOEQtn/iqRQlM0/
	tDVoE47eywEGt5C55u5OlMdjcAGZelHwV3CuglAZB7WbB0xDLyjr5nENriQeK8rBc4CdqrbBb0O
	tQpYW4ZK0o5OA64T2qAgSjrB0/to/6fq/XcUl5QcdINL4bJQ3TGaWoqTr2xjWIkV1floT9x2LjE
	7jLsc9i/NSUB+uUny7pLWIHRA7k63ijzgD7+DBx2a/72yqjPsC2JK3YnnoU9+Yw==
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4416936185a.58.1795811596677;
        Fri, 27 Nov 2026 12:33:16 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4416930785a.58.1795811596241;
        Fri, 27 Nov 2026 12:33:16 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm757194145e9.2.2026.11.27.12.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] media: iris: Support HFI Gen2 on VPU2 4-pipe
 platforms
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com>
References: <20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com>
Date: Fri, 27 Nov 2026 20:33:10 +0000
Message-Id: <179581159079.3905807.7535868776116331018.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=454;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=dZVlzXHIaOh9wqFfQSZFQNICJwCt4yuBTslnH2BoLH8=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCekKV4Omdmz5kzHIKBLrXk1+vAZNJb7tt04Dk
 GUa/EqkyW6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpCgAKCRBjTcTwaHBG
 +NaQD/9MPKSrOk2XJ9cGldG8chA0tmSFhTLp5rXvNQzag9wKaRzE+W5N0WYOqQEqFFqOobP7xgA
 NKXqh6abfoUmNVI7lkW01z7QYifStMCSQGgsI9iAB6CZxZ2TAsrEAdgKWIx3k8Gum74kJMCUCCf
 r49QKzBFeeXyVdQHB1dGLu1V5BUYjST4W7g0uV9fzDm0eCbGTjj3+z2xnUQaX/Rta8tiEksk61D
 UCq3+zfzlFswT2qPxTYPOqcj70ys9W5Spb8FaG/C53pw5n3uUcfpBuSvo3LzB6cNBZFNc0CQ6ET
 46fbU3LFYEEJ9kLsDoG2q5TzrJ5MFVC6arnxAV9XO/xjU9/w3xyDVlOMmthATF8LciRxfdoTT62
 kPChEZ1fAk/Ad7+1BFjd7AUKZNXjVqpJAwLHO9zhIF0xw1QUC5XbAdXHsy2BRFDAAaaDe+bnz9Z
 obWubKPeaM/xYfpD7wcXeGAO1XaqqwIj+Kq9VzBfN2ZNh17/V78dxEPwj2hgk/iP6GTLRyxs8i3
 Ewj5xKZTXgKGzW1R6Q38+9mKYjXQBpTeexZQUoG5EYpg089GJj9iNQsnO4DslqXy/j1X6maUlfA
 VqXZHrlVb9MKCbPlUhjFNLPyUIY51+ALfvbPKqesZJeJUV9IxU7zG2OiRLpR95NOEZU+ulOcUuE
 fcAU2Fu1PttGoMA==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: 8mmaS2wQW3AXSI77G2Bkt6WjtKoJH5QI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX085GWXMnb3ql
 l6QRoPB7Zo47KDgU15Qbp5lBie2XG2wTXz3ZlTfvf1k5BXRmXTCs0zQrzQK2CPl2uZOsrRN8bG3
 WJp82IMsFucr8hj9nQy6Abxi6TmXxxRhb0RJDxidsfjTcjCqZjVu4Rg/6ou7HA06DeOvudj+soB
 Uiel2ItP99zZ6qCJavURA+BYtK5wV/1sBHKuu93L/V8whCUAvR6+XK6aV3pCrrKPeTA2M+uRpTh
 kntqEyRgMfPryGl7NjA/ebD7spnvV/ke+WiEcwogbTKlxYxzyZMVSAbKFIpvl7CV//g5s9PO/Cr
 etKrMHVkERNx7lOrnaKvnb0G/Udh4Jeh2KgcbgGM5mdg9JskfGv33TTWGzxaQDMwJRQJBZwHGPh
 v/JVc+35YiD1EySXDbaDLOIzxeHLBN8DcR1vzDryjzn+PdO4Jn2yOrrOygGWl22pX9xUi+Ud3ej
 e7zSAYeCIgQsKcJK4Pw==
X-Proofpoint-ORIG-GUID: 8mmaS2wQW3AXSI77G2Bkt6WjtKoJH5QI
X-Authority-Analysis: v=2.4 cv=cJh1IVeN c=1 sm=1 tr=0 ts=6b09e90d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=F1k60asjd3FdZ7QOrLQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX+29aMrO959bT
 l+Rfvi79vs8g+VF/ofCFqAd9gKd/pI+LeD0sq+Ufq/DP351Z5HMolfil94JWN/bWOh01UbQs1R6
 xvjSLOXWqtagqr9Yi3UILcw6znp8CvE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Tue, 15 Sep 2026 22:47:32 +0800, Xilin Wu <sophon@radxa.com> wrote:
> Some VPU2 platforms with four VPP pipes, such as SC8280XP, can use
> HFI Gen2 firmware.
> 
> Add the Gen2 firmware descriptor to the existing sm8250 platform data.
> This lets every platform sharing the VPU2 4-pipe entry select either
> firmware generation at runtime.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard


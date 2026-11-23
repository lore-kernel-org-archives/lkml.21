Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462935;
	b=I4XrGgx8yK6YY6F0/ueFBRvCIaEo+n25RLxZiaVr4Pm0NZg9iHE7cgFA2k7X5KLW72pK
	 XaQiA8PbPBxc29M69/M3dO+m2DrX2kaCZGi9/acluFRiZluDzBSkN5vzb0xwXCyWqiGs+
	 bP9UfsK/OJS7R2ZYtdQtjPrG62wGZjU9f7NZVCSegtMz+JkMFwE/mtgFGwiknMAAdwp0c
	 0qT6+hoUUyO1MDbV0pQQK+kxuR/f2/+0p25iV6KdmReZ9NDv38etGywK6Vg4aLaomSge7
	 UQ/p7t8MoID7vYAABUVDaJj1FaqSlXuNbUgc7inqFzqBpZGh4xRWXRZqm9YftMBXcGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
	b=EZFhWLHbJxbrPdV3a9rJ7HBxu7BI61CqHWjBSMZH8o1AHMg2bSuLfJyUoUBPiHeGQyJ/
	 o+/Dw4866WkIw/9m27dJs7/VCkf44GMM45T12q/mpe00u0B+JSyqwU8/orMnqTk8aFfEE
	 i8XjdE4kUMlElpq++sLkU771ANu6zgYeUqhyBDFOg2Gp2Z8QzRBdhnGSwc2XzdmuX0etC
	 yUAibJXISiv5ZTTn/Uy74QLNfwy5o2fstwODIO5u6AlSwEAiCreU+RSTrn+F5dI6Eq20+
	 01THIruao5Nu6Yg4QCPsojxKOAutAvzzyx8bEserv+842U4CHWUD089pmuY+GTea54g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ln3J9Mbz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJledeAD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C2D606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C2D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ln3J9Mbz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJledeAD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNErP647023
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TiJHHZoWYTxxWc307M21mACD
	+manX7RHfmlFNEd6ixw=; b=ln3J9Mbz/Ri2MWC4Bqf9PAdfIdkWPONzyUcCiZt4
	FFQbUFaYfbFupBqSQIKQelR+CcKaFRG3ls9jggcGnPr9kLsDb61FoUsEJhChY/Lt
	8A8u/9DA8IM/QYMAu/12GJbsT2s6ojTMmD8HVcVJ1oG6tQioFqYqEO5K4I/cXo3b
	sQMtVbGe/Otl6Fh+4Bd+lS5BsFxnk2AOQzz2Y0KWGLbHOfeZQT4RyzK+mLd3qYRL
	soTv4XwtplyZKWaTyJD6PF/hkYRn9Jz/5m7PQ7sOKMyUEsvo+Drr++uofaBhid4r
	df8Ly4zgMFDsz0ibhPfx/ObtuJAraO7Vs+nJqS9HO+SoWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg29t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55cc3c32e15so40715201cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462933; x=1796067733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=fJledeAD/Q337FhEdpWoMXcQ0rPoA6Ruw87iHoL0Lf3C9voBR+fWVdivt0mA1LvS/r
         OMGmnroslL1fIThUgG68fQwO9AIQMm6XoU/MEAvzkKlYqlAK8PpXe+BvA0K+NXdPWmuf
         H5VriLBey3DPfAJ7PCq9fzGuKCS7zvWpVVDm4XLkncmqduPINzsV7U23DhLnyVFysyct
         DswrQ+yKhZ3qZF+Pm+iQZXhk5Qq7SRxYL5oJ4HEX8pHoQW1wn9gxM2wOrloy6SeKai9W
         +babPGDPewrUCUE1y574zyiTRdrQ1WrbUV2Hsx53dXQMZptJ/QTrGtt+jPrCwPIjtpaY
         8Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462933; x=1796067733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=UROIrPkiBfbrODNj2HjMABsm5oV9toR7pAY/F8hrNNU40JsZ8Q9pBfVg0CvSPcFEU/
         sT9hcnDO3uMiY4nTn85mV06BsFxUXpDtLnkVJxv/rbtV022AJKScrb+u6acGkjRZdl2E
         OumWfztRSmARL3DEwVWpwRQ/+vVEKwWzOBghEIyqzyjMGR7CjuDJ336TUw67znEcsp5E
         bFBvYEPQ+UTGbVmlsyhAcOViQhao5neS2jSICh36whcgHz20duC4SOI8QVBbbWLN83mY
         Jf1V4lDyDJTyUCOHqfNaYeNFKLeEZzGT6g/UjyxAuOxm5XDehZBMX/f7eBfO99Pjp7Ab
         R5VQ==
X-Forwarded-Encrypted: i=1; AL+hErGItTThyf5AMtqjt9IoFMpjxiMZbChAKtAHc5tBnPiqjzjzhQMcSXt6OYf1JxOkmEpTk+9sW8VzfInQ9C8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f9D9u0ezudlv1SnW93ryoOofW94jOSlRx0p48kt0eb/rcnRgS
	mwOm76OOMnq0AwEeI481ZI+ueX1cUGpmmDltaeu/FPKvL+wZlfMOa7YzPDUUo739NsUcVnQA0yo
	vY7mfTImJQlxc7ndTJESvTXN+WvMgub6avVhMprvtJ6dE48L2z6mo3MN9txO5hc6ksawb7VhMOW
	8=
X-Gm-Gg: AZFdTZdLW7V/aRBjvyIuhppINQqFLx282x4ba5Io1nD1b+HUjW1y7TZoZocGp0Du/WQ
	1IJKTxfGAERIJP5OQHoKFHkjvVRjHhY/TG1fGETFbqwuW2Dx0tobhtbNos+YZ8L1q6ltRXNHsGL
	GEejpg1K0EF4bRK6ucn587sWfJVFw7Sifon12o2rQ0MiKZ6c2+77wDuwf5V+Ub4WzU0WOgNnxeN
	wpL4ADpthQZDuBO3CfEEpub7X1nu30kxfMGq7Bxm5xQchqcFM+KEQxZDpvjh40TgM6yb0KaXBZN
	qkP9hhDgxCad7DA8k67pDlL/2XmdGTRdEl0cYZPtgjPcRK5gjYGZEmBUiwsILHl/4jc18SkHnKG
	FQMVCwEFI523nl2yS69XHV85+F2a6GS12WnPXG49dyAyLzC3D/HMFRC1P37F18hjS
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449601cf.27.1795462933038;
        Mon, 23 Nov 2026 11:42:13 -0800 (PST)
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449201cf.27.1795462932439;
        Mon, 23 Nov 2026 11:42:12 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm25764593f8f.13.2026.11.23.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:11 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
Message-ID: <6obybmhvyuxsp3jarjv4z57ojjfprwss3mer4vq5x56yhhl7kk@fk4ysedbakif>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b049715 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=P-COMtFXNwbjGjwEE7UA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/+twONKn290G
 w4HX/wCaMCUtBSSJaQ2ztHFSwE6JZ48WIiHPPnStgaPM/+Fhk4H1YPvfJnb6IsqPl++qY2CF890
 Rz8dBzTuXnU3U2y+GecrTvOn0zHEDRqZ8V/BILlzUTW0K2S3REWT48uzczYa5IujJZ60sAeGt1D
 PKYGMMb7CaJzTVA87PEW9ZDSovrUoD7WekCEKaXdVSDuJIK+ftzldu4yUrYnrRM/XR1Pp0EJCkQ
 hcLWnmBc10rs2et6H4BCjNx8hU546imX0qu4H1w+xdzLDenmOBkSnHYDc/ij4AlJZYA/weSxz6r
 CedC5wgN3IlbXQB/PEv2vsgXphNmASV21INOrboEt6X8a4/KYuYo+fesw4FX+IEogs/+mlJFyoU
 KugoGwcw3bmiDGzE59UTAAnrs0fgZMque7Y5i18exXShAIeAafdYp7QgStewQy+tLvgvfxyswdN
 MdR1aofO7nzpuZrv2/A==
X-Proofpoint-GUID: _W_zcYMHH5RxMDMRFoblNYQ62bnYgNXF
X-Proofpoint-ORIG-GUID: _W_zcYMHH5RxMDMRFoblNYQ62bnYgNXF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX6FtDL6SFv9R0
 D647XFBwk2fZ8eAPkIHit908/fPyv8xj+nzlev1ykJJxRzl5ShsQ8m2qeNcew7FrHm0ujtJflW6
 x00MeaP+2WGjwzsdUZ8T7Wo38UatYbY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:48, Bibek Kumar Patro wrote:
> On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
> interconnect bandwidth vote, the HSC_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

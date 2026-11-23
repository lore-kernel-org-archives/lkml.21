Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462525;
	b=uvlNu1NtwUDW4uEi6tNhRYmNsHPjdIQxLM4ajr3hWkTlu1ZEbZWDTzxqKqzAGHMAj4Yp
	 gRIqpYdIRwbYqtCy7WdVpvIsm0SGPzKuYVUHL1WuCxevl0gT1/2QXi3WbAVUtGLATo+m5
	 0Q+YU5BlkFv6x8748hAEMf6cJrjFaxP2JrwFfvj6F5E+iPc1wS61X1sFVB5JnHoQpJJ6i
	 Ic1NYdYfR8bTuOwzp7AcPrljxYF05ms3+uqPsjDNzesK+uJow9Bu7AUEGFCV4My6oiN38
	 r4GsEEfHkssV+jPZtBPRyFHw/L7Ss4Gp9TVRyUEey2TDewg89yQ/5HpDznP882bEoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
	b=jVWuDctenioOe8sAtkHUgTTFhFPyPUHvjUV+A7bFfm5E15rmngGU2kSiH1sEvA7Ql09Y
	 4kUqoWS1GfdaeSOcclEr584SYRDmeisf4YJa3F4YkroyHOm4JeeEWIvhZUFE1OHiO8sHd
	 CPREQ122t2xbGGVfIa7DRGBUvoSNZCceyhtrqsr3w6kdkk87E+UdGDlWvM9h8qU9rkwyh
	 X6ZQFL7Y3cO30mPFgB766pfL+xaR/l5eg59VUtUksrMNysh9iolgDJCfIvc6VmNefPIyV
	 39WsmbRYHySnTltOtRr42FePQjdL+NSzpzlnoiP+MyubuhGR571yH6NVdWseo9EkSUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74B606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D74B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3jl1093800
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74mX4a3vRqZEyTV8MaSaXTpj
	++Dtm74ijLlv0eeiueg=; b=i0kM35MMHabLAbMOP4SVW3ovhIuBCRprPcSdpGRR
	1j1pJ+96IZXsT1MNg5tMrEEZnBOBuXNHWOA6cWZ2mVHyqAqy5902QVXjQuADfDTa
	FjLmZBnM+ld51CWIcT/1sDPHHKSP+DDHeJW57IM+TvaLWsfoseZEfNUtNjAlS+pi
	9jxNWzT5jyZTWr06p4kc2eBME22hGa0ju0stzwpMyY+qY/v7HHcs7Wv8pVBmuyUE
	d2163ZYt8oynYY6rPHZt0b8nAIkCVBOU1XqCtJ6H2H6J7bBLeraUaV+EuSmPY2p/
	ODrGLBWyO46RnmhEkLlUo1ai/Ca+7RkDRriy1Okd5fVvpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t218-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so924766885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462523; x=1796067323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=evuPWXBg2S1HDs02kVAFSafa1UPDJ/qwUXhXw4tcKqyhkg5WJz+fJ9pxPHc/oXbUUa
         QeyVeMnGivjh87mhEFVW16GXiiTEns6O2+61ZSlsQiCKTu1M8MUm/QtcAOpj8f9fgsbC
         tSQvql/i9k8TOGkxuZZCMmig4n47F67fYOTO7eeLA53Nh3ZVaCgPm7lVOzgPoi8LihK8
         S3cXpxzm0L8jjgQzmL44gLOI+59swUHL3dg/6wvBV5waJaLKp0M0Gi2AcLClC8+5/UJP
         xNgaX8iGcxnpdDKoZiHe3IyJlFXDY2wjIPtPcolCB+AAuNO0X0PrwR0f4sQenwuzmyAN
         sEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462523; x=1796067323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=DnGktkpd6H5TP1Ssg3gPGdQYIuVnnxeg+DQ/Wt4ErhvcDSXBab28zSlIuO6gb0M3I0
         YfU1y4woNNEDnyg9Rw8dNN91Kd8EpR3S8bayI7jDGWAu0+ZRZ62d4kvBtLcOUvxYXZPb
         J6EXXSw4yLOUyBxhOipEJX1S3OkqIKiw0SThz9ECsB0+/ZqycEbgElc2vNViHpnU5SxU
         FyjLsi6Tvid8hCq8uZY0NaBVmdY+HOrCw+LfJxzQd3/JXVlRUNu0TPECUaPVbgRrKTR4
         feuoNO0TJWCeyPRSsHfGI8GaAfXLGgZJnUSKlXZIscUfnvLHlloGZ4rHgsw1wpNsknOv
         nqOg==
X-Forwarded-Encrypted: i=1; AL+hErHvnMI169aDdzg5uVlQzgI5PSgd5zCkxqDCtr9ql+vsrB6KACHShjyE+cielgWWNRcgR4nEQ+fPKqzUrGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UFcppsBUFrMEj3VsB0hmhBtSXAeneBy3ydoHnhp3Ru0RXa5sx
	5DkZyEjdR7T8I48MCsYrRF6SqzYlyzMV3mpiNKJj62JxiS/b5LYGeZSQ+BMnMeOOPvp9AQ6CpH9
	3WorXlkIlgIu8FecB32aw2a51NhNMF1SZp8Q1SYjIyNPY5XsEV8kIjH8ReHWinekiX74=
X-Gm-Gg: AZFdTZcSDZlPO0MHCbFEPhbzTEQoCN1p8LVZXgq383dTKM/UDn218KPFRlbnzpLLzMo
	xD0EPBB7RNN2DWRk/c9B0kX1xVXFsIKDoIVROgyontpm12KoY94m0KZBX8vdzDt3gu9LDvFZQtj
	1WKgtXxLpbhLHfYtQp7HYFzMzy/OYfYkGvZGKJOwHOIcNCdqfU7JxNpDQ/a4RA8mmtlAOIQFGaG
	KOqZyb56LPuQzCTMS4eFZhj8X9taM4MxzSy0wrOk15ZLqrC4KV+G6ziMuJbrNdnxt4rP3xovqgl
	NCkLZlnE42j6qordtnTK0FolNsvfw4c8gZqlNbjyea9zZ3oswQjGaazeQ7768Ezr3LvE8HLNusU
	BMxG2aobiqgHNw8r+TrAlqdVpxU0zN5fzAyKOeJ1gn6vMqUU8CqPxsuIgtrKZdddM
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134933585a.8.1795462523294;
        Mon, 23 Nov 2026 11:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134926885a.8.1795462522682;
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm184963885e9.3.2026.11.23.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
Message-ID: <6ps6o4mexhrbmcodgl3yze2pobq2vzao4lrbhqomhrc2vbfjb4@zmuby52sku6s>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: 2mVf9D4nU221B0BKDGTLgHIJG4ivbYyn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX1sAsomypgjrF
 4ow2kLniZZ4ESL39x34tVH/IRASAbIL+gXO76N6hFThV+CoRb1OnuQD68w0fLDsPBgpDVUY2TwV
 WVtZsPYEF/+i7Eh+K37iDlEz9/29pMs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX8VyE/580lVs2
 3gN7jABmkUqlmviy2Jpu9+sRRUO9uPuL4VeTVbetQUPg2Jm1HUDKKpua6GD6ijEUjl0PyVbzXWe
 84ZSntZ6jq0/7SSX1IVTmLT+w3Z7M82NY+E0J5LfqwtajnKc62h/Wfpo1UAQIcMdDcztH3MAN+0
 fytA3plCeCHFS2DGmoo5NTFGfdWjWHDyMH1XjqiqS1iE5pcwj+ytP473m6KZm391R3rWUL78TgI
 uCrl3mxKQ77+PVActM1Yt8CtK1uLABHCUS06xPyBZnymc0U199NLNtWXr9khoh6J1P0fAmRTerV
 9HvtwYYNlFqGU2KhIVyBmVcX6LHS+N3EWuP8EProy/dpKzKdpBcKz2C3uMXXzF+y1icvkpbRkJS
 gqVeY19UjGaTCYO1CkUz2epmo8U9LdIoHUaNjguLqIEy30okewAuCSdFfE8PFbXVsCLPJied3E0
 keKMkFo3g+IjvQ9UkUQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04957c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IQcQmC8h3zhotARXj3UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2mVf9D4nU221B0BKDGTLgHIJG4ivbYyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-22 16:14:35, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
> buses on the same WSA Playback link. One MM1 playback open brings up
> both chains via the machine driver's multi_direction_codecs flag; the
> SP<->SP_VI control link in the topology handles the DSP-side pairing.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

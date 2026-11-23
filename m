Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430494;
	b=BEdcsxL7siuU9FWbN5k/qFJ0BwiINRHXnaHuEKJiODsnaxM8HZAoDuWx6lfNuUu/hqp6
	 bpGd9ZJWLzrY6E1jH1tiGuXCNw4c0clTUNf9f4A1zw8qOyAIlt69i8p19tAPxtsNsgDma
	 Mvpo99i24dmLtIEfc7n5CjnMzA1NJ2zuVdpfiyFM2YUyGW8PmXV4B4h3Td+BkicBW7pYl
	 HSbHOQbwl1oYa7HirmgeRSmjo5X5qgnBKzOA+88w6bNiK/ZslByV50tXEOkdGpJJwrvPc
	 A7jlFeTh5oMmexKNVu4kAqMZsnEaF1HMm+PDJR64GmFxf+hnFD43ULqocrWZv3XZfOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
	b=y4Mz83G1P5Id7Qk/cx+kNcL9mn3Pn7fGVgiGdy/GqjcgHjvPiuYx6u61gh6LCeqg2AoZ
	 ZZdaHW7HHBPbYlJ0ooar63wl4llWJwR1LeQnWrif4VJh+zUWZkNN4iFxyor7UFr+hkkiy
	 xCfRNStFJS5GJOpYGUTDBmGdbEWkQxUKJ2RLKuO4pIlxHORh9kvfF6YHiRNnRZ/TLHmxV
	 0dzm3L6YfwyvRyCV3j4e45n+yDvnXBXtMl3uXXd1Zbkz42SsgVP4hIlBhoPpf4mEM9z/T
	 T85auFkF3eXsmoPqrMJlAhYiMtbEVmZG/bfu9cv6ookTXLZvzeUhFZ/BKJT/hJxW66A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MXL4C/Tw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED0C606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED0C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXL4C/Tw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G0hg917246
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=; b=MXL4C/Tw4mJRyCmS
	/3p5pVKnE9YSURx4VBWSffV7NPCsb1eQwGe5wCJGoutqbiPziJG2dOwZ1d1EOmiO
	Fj0e28GKZquYDNB+ixNgS7t5kWFZlT+dicAGFFGH2n26WY2254ET/dxV9tPKsjw8
	tAKJctyF1vXmlEPUOzL/FCv49Ed2MMWEdLQB8U2IripixkCAm0Nf5W4JU12hc0ZD
	eyapXyta1eZz8hQPu4SyeTbBOdVB1utNJVzULLylzLeNjMz5jezX7zVOeBH5X4Xb
	rQd8Ffzj0FFz+VSl3KikyDhJ/DEV5s/I9eNRHPC7HNHRKl0J3mLBHV1rI0DGWOVr
	iR3gNw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0x14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:41:32 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d978e4faso43298067b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430492; cv=none;
        d=google.com; s=arc-20260327;
        b=FUMtTQlVlTU/4j9YvSbhwD7rdq/D9j0veAyefO4CcUPzm1RcTtgmmleFZpvgYY1S4D
         FgrQ0V7rvw/0+tMQYJAXW7lrY7y+BtH6PD8XvMUR6qgwTBZBc/ECB8HAObszsOdyZTxL
         Pg43f2LZexFa05ptSrA+28X1QrT29eurrEEjQ+CRT9SeByTlu0aryXsp1ndQCdRQuqKL
         3h+71vwENoHnrRHVOg35HEuHt5w3JrpiSt/KSolGPL/6nRWKnjByWLebeyRtIGmKW3p5
         EKX9BijpF9N/ctNOgTNxpGO0gD63yNs/2cxG02eS45d8/hF6dFER1vgRofD7dZY3PEyF
         feFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        fh=Y91wz0OfRqKUtyU5GwjlDxSOD33awcZY4WkxfUEYqbA=;
        b=XGILEDJZegwgLSN+cPAFydeOLg/+amjZYea4bh5HUJ9FVYq4KaUVRDbKug+HKQ9ZxY
         XgXLQsOsFP/yYMVkWjBG4RdYj/h8xagMo+6W0z49aVljYJ61zkt2yTALTcEwqnkEu/jG
         FS5UlcZLRGdiuBK3LjVc3AWn00JnvdcdTEu0Qu/ETfZ1X8Fa4YWRX3LiRxk6J9Gbxff6
         7pdPdJk12Yf7chjHfUBllC4tBqcbAZHapmNHx9WHbIOBp4P4RQKyXIC62k/j+WWOvprt
         xYqku1GWOrk0DIG68JpjZYHLuNRsaDnbhvxQ8ly2nYK9frzLtmkvVK+8RJw/TJHE4wHF
         KExQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430492; x=1796035292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=Lv8chtU4egopjHPByugmBHYt68mYV9sT6UnGb8LtCz2Z+tyBUhkJEZCyajUa9z+vne
         DMVUjc2yzgCDUkHb3HpQqMV1kAykX5Mx03SIHESvSfXWWmnyZY7EriripzhkcDTY3m67
         GwzCroB7DEwD2tn/nRKu2Z3y0Rk5JYelYDyp8fDlcZF2roe+9kO3UGVC0E8+oqXp7oWP
         gYMIQCMBpgoRoPKDGniCODt6DhOQpN/CjnMP/j4Mmg7raVXxMT+35Yebv7+ZVzGnv9cP
         OqT2i3Tm5mhs0VOPSSfvhhkVU5PuJhufr5rDqD/Vz15Up8Lq9RWLtRH47dXTAGrz3/h9
         WprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430492; x=1796035292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=YfTND1COZvxLa5+DSSnz7WFH21tDqHLRJ9sIyxHUGzI/Y4t1OBzNj2dwsPBaEBiwVW
         1j2Q4RvBXmRxRQjQ3HgKVzEJM9VYDC2mpuOf14CbKEAem2oplNcPYhTfZpvI71lzhR2o
         gW4+F8+FCNuqGtb+rnTZkF2gqzY7AxSc5DKY1IsuifsgFgYS9VlqqpgqpSiOT00JNya/
         SBgtl9uiAfRhV5All9YpJ4ssWsL/lS0AUgZLtPBYDanSYPfxaj8jAzVHfljObh/9FMdq
         MEgsJs17LZS+QyBCtfCUpjqaFZS60tlg1XxVapUEhtw22zG05SJjqVEaJ+BrbyN54D7p
         RT+A==
X-Forwarded-Encrypted: i=1; AL+hErH//Uuh9wCjwH1r99F5/YYFcT8JjaiYDLEds/ynduuxW1ugTAPtPOpmqQhbcN4/E2IjspYwKmUeucOM408=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c65pzplAmVMaEoPQHBMDBshbwQ2vx8PwdoxcyXVkVbvDLgM8Q
	PkfYTSBnnH83y+qd6bhJnA9XeF3wkxnn9iGh00ZRAtk0niTxqPs2hPGlQtjsYYYAjfocSVWdDKL
	4Tofmf08YJBmGGpWS4W/MgG3mc0E8ubaOLIAlOQQ3L4mwZYjRQL6KywrEKmrUqr0AaO8yFH544P
	vRc+qL2w4kXfn71S38n468WVVJHu1OpgUuvCMMOwwBJw==
X-Gm-Gg: AZFdTZdO/ylEudrSnHc+q+hKTrb2kJ6rkahawLBnyBQJSahkd/UF2vqx2ITQEK+Tbn7
	L7X8O23AuleXSh+26IgZNieXY+0AxfyuiQL8fJM8Wf30A/MkZdRpZECll6SoTkcrPruPCP8MXNg
	Nqyr3hrokKvYXtr3gwwrkelZMinNpv2yuge6AFkKyVzpu+f/cjlP+aztk=
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id 00721157ae682-8b520518c27mr42200317b3.67.1795430491819;
        Mon, 23 Nov 2026 02:41:31 -0800 (PST)
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id
 00721157ae682-8b520518c27mr42200177b3.67.1795430491400; Mon, 23 Nov 2026
 02:41:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com> <20261123-crayfish-of-splendid-courage-c63931@quoll>
In-Reply-To: <20261123-crayfish-of-splendid-courage-c63931@quoll>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:41:20 +0100
X-Gm-Features: Aa3M54oHmRt3xfqR24IGlW8Kt6ZRAtG-3k_KFIjDV4TNG0tPhafKEYvoA79oUAU
Message-ID: <CAPzfCAary8rkKeF+XFRFShRiy6GZwh_ky9_mo33C8+gGSxRnMg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX4na37+eYGKWB
 IrJnr8UBzHv/akHZPhxztuIrHvwj/acSanIN/PjAQsQzBBnqCQCpmFKaBoctkQeIJA+UHU71Aqc
 qC1ZUwezsAvWkj/Xk9h+izbs+f53wC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX2KW3jtRcEAHd
 QSqzH/2xvN6zTnRUoll2bFAPTfSi+Hq7ltULlIaMpqkdn+ePDXxIvC7pNxYooQmQZZRkUH8aEPc
 p5LRpORirvdQMkF+f9Q06leKv/rcwz4L0xl45Qo2BYv7x54BqT2tVwMWuSEcVpF8Zx+Dl91izX6
 cm0ypFKcicRI46cgYjnFSc8kgbk0rR2GbJmbS/l8rHexonV0Z+wKZWbPEjZyzHUXHTtvgz+lRZi
 7QdcyYSlEBO4HEO6tl+e8mk3J8OhkepLhBbiOIPCiM9yxG+cG1BJldyhDKFds1h5sih5TyuZQUl
 38r4YtpbaWNm+d8h8sLPss40josVJEAKgypPWyBFW9A+rCYFFRoSYkIsmeXDU38el/GwJda8UMt
 CR0ppYxsSnps7de+kEa2CeeaitR6vYsCUbdk9K87gwdy3LJXtOGRqH6JBToGt1rCgyYQPS65Zee
 AII9dpcghdX3eW5IArQ==
X-Proofpoint-ORIG-GUID: Un-CpKjFQZyYAwseXvvGwLmSzaltY-CC
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04185c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AX2TNvW1BK4AuF6XdYAA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: Un-CpKjFQZyYAwseXvvGwLmSzaltY-CC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

Hi Krzysztof,


On Mon, Nov 23, 2026 at 11:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Nov 14, 2026 at 04:39:04PM +0100, Igor Opaniuk wrote:
> > The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
> > CSRs and the mode manager register that the secure world writes on
> > behalf of the driver. On QCM2290 the mode manager additionally ignores
> > the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
> > the boot firmware does the same before enabling the EUD, and the
> > register is written through the same secure IO service.
> >
> > Add the compatible and describe that register as a third reg entry,
> > required on QCM2290 and not allowed on the other EUDs.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

On Mon, Nov 23, 2026 at 11:22:21AM +0100, Krzysztof Kozlowski wrote:
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

Sorry for the silence. I just silently agreed with the feedback and
took it as is
without replying on the list, I was planning to send v2 with the
sashiko's warnings
addressed.

Is an explicit reply to sashiko's review comment expected as well, even whe=
n I
simply agree and address it in the next version? If so, I will do that
from now on.

Thanks,
Igor
>
> Best regards,
> Krzysztof
>

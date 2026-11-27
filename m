Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817060;
	b=ER0OGmFQzoTGu6xPh5QLcBvG5POL3Oo27vudg0pvoz8p5c150guG1Qc1Oa5y2/HjTNgn
	 D1ltSfKppDiy51ge+7PL19JwEzEFOeVzRbyENfnS6shGY5FAEou7zQhDoXCc1c9B5n9zz
	 Hg4Ebv282/mUJXvhzn40eTCHCwlFiP9SGN7tIiIIwYvbFd3XSH8LgKcEnkWua/RvmXG6/
	 ZzZW1shbo3s9GOm5VqihBeYwUTMi2n1zhUTxDSa+YoWEtZDOuDMM1tn8TzanFocjPVJn6
	 wXOnyqooQMOpw5tUPe+tzk724uv/0MSTwSQK942hdZzF21uK/6Pafvb2o+SKuBiy8YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
	b=PBndN6lDQpW4o/DoVE/X2s8U5EmFBt7N9yewcV/o73zsdeiXGQVdH8ZaHvp0Cj3oECcO
	 kGJBu3czKTs8sv9IcWJwkRNY0x1uI+HlQRISi3olDtJap7VeBkurHnLtprlTnyoLPNLrr
	 KVj3tMHuRl+/h4cAUInn9Dciy2+VmUNi1tAkiCx7LoDUTIVuBW+VdBVutJTGRBsTMF1bx
	 /Ot7m8QUT9swKY7vnmnV2D0aARIwKtqKmugQeiPUb9LfzH84+8LWsvx1J8fl9LvNa3IYd
	 hCGpJ+GIhCC3Pn9tVsPNX2CAq0sJJvPTUgR2iKm0duzA8DtnBmKNA9yTMPNwh8kCDuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuV5uhcl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eXwLlq4P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA831606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA831606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuV5uhcl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eXwLlq4P
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRd9k1381604
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=; b=Vu
	V5uhclGLJCw0uuDKiYF9CAaZtWBrhjmkkK5vqeYo4SiQvna1e7VqqrIsW3j2OiS9
	0/mzPioQGVmi+zv538EbWc0GY92sAslAei8nYZ0pwFIcL1BUQW+tHa2o8fQ9v48y
	9hTlRQlYhqIq3gvlaomL0BPc+7CfUlVXyQGTSiEzifDRX4aOAomRg0aMGI934hg2
	jjfgoKBjYyXAjYRqilnyAUCHA3mZnSy0rLXW/Kr/cGozYEcZoNGXGywinJ/wwBub
	yMcVjuGvijFy/92EnyjECH5/xlx9k36H2H1a0sysBHaX1wM1HfHaxgbi2KxQkdIH
	c9uQup0+e3QZr/MrFJrg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s89jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:04:18 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-458326d2d9aso5257458fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817058; cv=none;
        d=google.com; s=arc-20260327;
        b=KccmGxPbEJE4hTpgmmvq6YqjkuWmxEi2DOTUut9AMqqSfuv+XiqaqyhqUIdjNwp23k
         0GFJmpEWFP4cCTXk3hCGKJByO+y/qXRcLQmCM8sEzcmpqsnsN5iomKb+JsH3oaXuHGjy
         4Gm/FDxiI4V3E+0eZABzlDGoxq/JIt4mDX2ACj36IGYA3qP3gh2oUE6P9wsuZ/4kDzrv
         Nrl2p4y9fe/hwrZhIPbVF5WC+zKXRBgJ5PzuGmK3FqsWtFuOQW63ulz3Q5Qo1/T1OZZ3
         0y9tyrQNxpujn/sEHXsnT1EcX4szjxbS3kTJOqnfN3fD3/BUxkumad2Hj5bFHe3/sDzg
         ge8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        fh=iHa2SRbkyKIZYjveJD34qrk3YLjNaZ737IuaZYrTYh4=;
        b=jJyYef49Zik1JenSk3yaOyGbpQGYRsoKjMWm1v0PKSTqXEjJmLEnsp8SwjWdcEoIsz
         1chV1urmSWt8VKwKJmWu8CxTMXvOEm5QcqTm848pAJUhBXg1j19sY6BhPmfPTtNilaLJ
         nK2GF4VawqA6AmHEcpeP8y+kSk4WgMiqRBEYsifGWohGSf9VA4FVhuRzmsdGUj1ZTOPV
         gcVPJbcHsN1bm6niBfjb+xgtc/obkZ5nDzFyfjHc6ENyfXqMQ2N7rbjXZL96s0bP38+M
         o+d2ycNzzE4BbUfcLN/TR9vo956MjJo6y8ltOiN5UPI8FJtX+KRLZHEiSRUOksW+8dEg
         kb+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795817058; x=1796421858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        b=eXwLlq4PYSgOHHx6/XpsQMNWT0E0nHzeVhbkOkjAmhom8njmHs5xWEfoylrxg6UyvV
         eOx1dxC85FK6zF8BKmmkS/K4W6KEwMcQpy6Rh/iTci3lBdodguOZ0Bp+bAOXEQ6hi5GS
         6C8IoEwABtGvlCpv3L8e25lHaK9aXiYueNT/s1eIlB7j9YfQaVWgQ51wyDnEzAX3UlFG
         KJfyIzoH2Z9IsgQW3yT94rTtSGEQJZLZa5nHCJTL4dy0SkvzBhEYYIbvDPRCbj/BktRd
         +u2yoKt57YSTzpaGbDs+3ZYOCk8J7S2O8JwQg8CvO7LK+zqEGnYTAZa9ZYHJ1bXIT+QS
         8fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817058; x=1796421858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        b=ckrgE9WqvqljZB5fwuyaOncDAchx6JRUphowLxmqJy6dccQqE3fx3dcqzdLKsml1Ju
         8j0XRyfslY3afqu9q3B2FEPcPEtud2zZnqsw5aHXG/1YmkaczMJ+oXp6p1h/YcZBaOjI
         3bmGnJHlndwDQZDn6NAMEEh7nE3YNj21n0m6sFvSyVrTe3Ppycrhuy8C0pq1w0v3nlL1
         IlA/tZ6YqEa046hbGd5fXiUsUnC1eF3xSBQbunJ8R6CRNGV57J2vvZulfdhhL9zrf66+
         S8nIhxZGqVwJCZPyqerQLBk3KxVUfYlUJfceUg2AMje4wHmiz4tY827A1Et7aZcdJpHA
         qVqg==
X-Forwarded-Encrypted: i=1; AL+hErE3CYNAOO7iS0VcvziwbidBUkQ627oJksj7IZtCRHebW38kozLrXRkSL7ahM/HheJCVQzh1bfYKSKnUwWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85ZvCrrInwT81E4R1S8FHOQtGS9mvXQ4nlQrAANfZ3sx8zMiIl
	SU1F5rWeFfYiOMVdgXcXC1y0rd65Qgyzy2xRxOXtSaj/olWTDQSEO1a4Ov2BVPSSkQvRmvQmEiI
	V1/9Nmo7yDO2lqEdO4o62rZbTXJvsCI9E4VmouJgmkyW4p52toLfB9euKixx5x5iI0xAWutJZ9c
	iORAG8vWDlfeXjrenNZPHEAp2TgIOwPM0CXLYofVHDPg==
X-Gm-Gg: AZFdTZfetT65/epkVxLSE2VRSe5HLTljEa1YqhgXGWBzXexpMnxW/H2X/HwA40qT4cG
	wKrniHv3OBH2LcjeCWbDXte6bgycMANHKxp/+fkT+U8s6yUHtEJD6pl4EUaaXPDxsOdE019urwK
	4jOAq/IqVadvmBxmIsEgcIRDqEEyT3y7G6ERvvOwV0uwriywgzWXNFMi8q3url2MaxDhBd74P2P
	vNgD7aFeOe0SG28tt4NgQ==
X-Received: by 2002:a05:6870:92c9:b0:491:6c73:817e with SMTP id 586e51a60fabf-4bc7d270fb2mr24823487fac.5.1795817057626;
        Fri, 27 Nov 2026 14:04:17 -0800 (PST)
X-Received: by 2002:a05:6870:92c9:b0:491:6c73:817e with SMTP id
 586e51a60fabf-4bc7d270fb2mr24823451fac.5.1795817057156; Fri, 27 Nov 2026
 14:04:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127-qce-fix-self-tests-v13-1-80b601792901@oss.qualcomm.com> <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
In-Reply-To: <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:04:05 -0800
X-Gm-Features: Aa3M54roYu8MrDi1iygKtDP3qZ6YDP-WhV4C28xi4aVFCCESr3FORy1xpwMQ3ZM
Message-ID: <CACSVV00Juw154J08msOA63a-_4TYvHzYqsjPnD_nE6jg-_=GZw@mail.gmail.com>
Subject: Re: [PATCH v13] crypto: qce - split the crypto driver into core and
 crypto parts
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09fe62 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=wJmJrFKEA18kwO9BSagA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: IoY4X4NnxZ4aGQMlv5KFryTSXvD9u_8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4NyBTYWx0ZWRfX2U4UV4PRNoMp
 KJUzPPFyzjpkMihnDrNhnOXat3fNd6Qs7XLpvlmdYlVZ5mVmls15svNz2F2iic3By3I7YlFD4bt
 1oayXRV0Y+uLEBcioeeTrp81E2opdo43F19LDcTIRaUQqcgMxlgYSKbmoKpnVlNUwH3nE5oP1qp
 HgzM89OZLvk4YNyyQRQ8jA2PFTmpOcqs1n2PG7lKbTBSFskyxCAQUSsP5bCRHSaz9+kQQvSirex
 hLdGfrc9VlDZS+6cvT4zbZ4rM8ppunznQk1ceScD07hijFFCGVJfvRyt5ESY09HHIs0K61U2pTY
 SJzfK35BVUNQ/qhzhwzCAhPoVdEwiUdh3S+1CThPCZZaJqiGRYXOAs/He7pkXnS6WaXr0NqXxpZ
 CIXgMF74SAtXoayTucHUM7BB6M9MqgJa11e1OMr8HSNZQ7Evr7XfyfZnrbeP2teNRlV06dakuhX
 UIhiBuBlu8gnwZSc9Pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4NyBTYWx0ZWRfXyLBZyTmJdBEw
 qPRqlyo2FrZErbi6tdUlwpum2KzBDU3R9O4r1Z4GOtaKx5ooFJowHqcx+GiLeun/cwvNOXH3YiN
 pA75pp8zSiCjPYMBmXlKbGZs719mrSw=
X-Proofpoint-ORIG-GUID: IoY4X4NnxZ4aGQMlv5KFryTSXvD9u_8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270087

On Fri, Nov 27, 2026 at 1:35=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> On 11/27/26 12:38 PM, Bartosz Golaszewski wrote:
> > Most users don't want to enable the crypto features of the Qualcomm
> > Crypto Engine driver. However, they still want it to scale down the
> > interconnect votes to 0 when unused. Additionally, more features for
> > this IP will be supported in the future (for instance: for secure media
> > playback use-cases) but this functionality will most likely require a
> > new in-kernel API.
>
> Nit: Can we use "restricted" instead of "secure"?  From the user's
> perspective, the media isn't any more secure than any other.  It's just
> inaccessible as cleartext.

Very much my own $0.02 here, but for better or worse "secure playback"
is what the feature is more widely known as.  I haven't heard anyone
ever refer to the feature as "restricted playback".  Not trying to
argue about the original name, just pointing out that I think
referring to it as "restricted media playback" is more confusing, not
less.

BR,
-R

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281494;
	b=aF6vft0xJaeI2xLMNCSo20CcYh9i3XMcKmdr98IQLc71i5gumNbXcf8wpXcnMfDiVUXY
	 9/uH4kxnfM68SMfHN+osTF0cyWQWzO/vGCYWgwbZEAQRCC0dE+wjGA7eK1bs0pxQXXlLN
	 lbmB04QlVeXcGBFHWZnU0vKH4caNRJLpSLjCgI+zyPoM+N6NSMoC0ezc0OixoupI+PXzZ
	 E5Usg+n06e2WL9uBUeqN1SfeY2z2/YSbz1KYyvo/SrXUx49dbbmPoXdXFKgSnSZ6mRqKr
	 LWc3sIWaBCwKozfpqA5mIJkqx7nMZ7niykkw66Alxt3QqYOwyYADNW95jZBaydise9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
	b=jKiS9+jdW+dEW4zjXa1NL9rw8wnb8ATj/X4xsPPeXoY+EezaXvHNVJUR1UeCM5uAGyvi
	 Vi9HtMg0+zcfgMBb2CdVKEE3wKywkYw+W8FQtCvtmqTQ83MNB+uA0qHlOQ0pC2xOxHOA9
	 KsMoq+5VbETX8D/1XVw/5SOvDvMX7nJkyjVf+AnESGROeWuUqCYt8RTlydxwJyfALxRYO
	 b62CEcUuGXzSBXpeuC0UmiMPyuDPiGbvqI7gjuwmBKfyaOGBCQBXXG3G0Ve+YwpVFC3IA
	 cpbcO+2aM/NdlB/tUSt9F7OJRRRHY+8h4si/mIDtAW4bYjlHqRVXZwfMSXaBQ4ZL11w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abc2+r3t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEtsQyEQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F7606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abc2+r3t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEtsQyEQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFZpRR1138092
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=03VTQUvtN+Jv+TFLhgycleO7
	JIZPD71MArYB34m/8/0=; b=abc2+r3tcdLKrXCqaPyBRnh06SBQTSCrC9mVPVED
	/UipiJc2XVtXNXRza1BfPueE5+t1TmX3lvTLfA+EzNV0UIWlPJQsZN6l/BtXzGwL
	tSwBlN3STr79yK/OY980zUhIgQbkXbEQ+itiz3ZYP09ChWFGiOxcIEOHqnAz6+vR
	ElRjN11JGN5dK/0mj+blp5aqe+ILtjw/m4ITVT3hm0q3XujT9tHV5UxLRhaULzK6
	bkGXVgQU6NrtqdGOTyn+yeKIKfC1Fsz5BHvVrDnje88/+dyDcOkdTwOXY2ThZliC
	fYnOyo+MjLIrcVVpZz577yHycu0zZg9cmOPrTIMvXJMztA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rssmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:18:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94967c6d4f4so222025085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795281491; x=1795886291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
        b=iEtsQyEQ1El8/D/GwdKuoN9X5SiszsQQHe/v5QoMOB7MAdIjR9PXOFVZa9Ewd8Uurv
         5wFk5bzB7058DOkCrf8TpBK2Z8Hi95aFH9X8R5TEJA26uz5ikqeQyMMudpZa6ulsKmqZ
         M1ki4Mxq+UN6RDVCXJr4eh/zL4+pZbiV2W3AQ8b/iwoaSyTfrPlJsXyHDwmOWoKmCq79
         gx88fkajCQjNTSXuXPdn9zvSCJKXls5kY+BnT0Cf53hgctNeGYXXtocfv6mA/7rZJyv1
         eIvhLDhYsz+nmdBoFu3Xs5IL0wymD8K8h5V7cMelpDvk0FevG2Kc0aejUciBLWdyaYp/
         Dufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281491; x=1795886291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
        b=mKSEKFq2hznDFvllGJ88WXhavqySjPutkunxIM8fkz/1tB31NLdHsMGH/LcFvMiC3x
         lxCNLaqUY0ZO/V4ydJ6Y4yyPOcg0ieGzPdnxbdGurWcRb4wmDJPSKtmTyVBA2ITaj6Gj
         8PSW0YAYj09pqmg6eewPVwjFqZqwP1Wnix6eyCjUbWmdRUj9GY/jEEUooV9O0eexR4nf
         er71oB62TkpBY+l2Mg89oMOhfrcew0bdJTfJGYDlLC3w+BKRFdAq7QSYaecoq0qAxdRk
         ApJhygl2/45Sxq/px/bQeNThMMxrv1rp8vaZ1MWVA0jrWzee99U1sJXsAHtJ5MMeN6ey
         SUIQ==
X-Forwarded-Encrypted: i=1; AL+hErGz3IoPni2/k90Oi+DGldnCVOLgsL7LUfavS/ov+jqTBATXEhl6ZKJce1WE6ckqQnfJGUQbtW9beDo0NJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TpX/JO8dIiJ0CpSvFyTiif2Xp9ocZQxMvvgMuWGmwNispOXJq
	LSP7CUKnrw26smH2CnYFe0ohs+0rH4aQfJIsyP2tQRLBgBPk6Q3AiuwnOsuGC4BhOA2YynR+M90
	N9Q4wvCArbY7di6ny6OMfuYZt1avZgUzXvet4n556L2STpOVfRWFtWfjK3q5mrSh5z/Y=
X-Gm-Gg: AZFdTZeiUWOaBx9Ih0BzMehD7u9uXJRZeNgTXiKEPTupeqFcT1epiLsRe3ZzDYY2hwP
	alOlZ5dqw2UL412SXW/cp/jCf73JL0WQyNVWp41TI5tkaJiORAgwbXyrGiF1uaiZFH17WVZ4kpR
	cE5E8Ob22FlGZbl8KJfssWR4c4axxtHg8k3juNajCJvRCJ2K7j924KFU+391ZK4SscqzzrsYYM3
	RTg2bGlUgN+gvMimq4AuYeV5XnlX/9OzdmtEOfUPnZxqMkeD2GJqj170nTcTdvZZKkaD4j6nF1u
	Yv0032zAYDSLTbZgBbktuEcSGLHEMLlBf9tIYbtgkQJEeXx5CRKCSWoxUl60YH/xbEo3iec0P8w
	It2OcNxEMMS4+wrzYwMPlOQGI7rkXSeEjcCGBxZ+IAvaQfcVLYCUKjjw56CS2XQYU
X-Received: by 2002:a05:620a:4443:b0:949:78dc:f90c with SMTP id af79cd13be357-949bab4d991mr1084814985a.60.1795281491306;
        Sat, 21 Nov 2026 09:18:11 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:78dc:f90c with SMTP id af79cd13be357-949bab4d991mr1084808885a.60.1795281490526;
        Sat, 21 Nov 2026 09:18:10 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm237635335e9.10.2026.11.21.09.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:18:09 -0800 (PST)
Date: Sat, 21 Nov 2026 19:18:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
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
Message-ID: <x5wpvqcrs7xe5hxijyjvoqlkojmwc4eqbw2su6q67ibfmzjvdz@m4kd6gz3iyuh>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
 <infkyto252rc2ocolww4ihjuptd5xg5qcjtkft7gpyssxhp234@4dnragxtdfxm>
 <20261121-excellent-sociable-limpet-fddb4a@quoll>
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
In-Reply-To: <20261121-excellent-sociable-limpet-fddb4a@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX/uuNqM1SWOhX
 xFWeC82S6Y2J1qeU7UVGGR1tlgTYLV6Gen1GQs6wAML3AkA0NOoqsUjRIezVwnQdnuaAGWpqEYV
 kHZWwIhtPqF0A0P5Gi8qXEF190NsM4U=
X-Proofpoint-GUID: cLfahHC7_yz_v2RR1qMnQ4f1oHFw4TgT
X-Proofpoint-ORIG-GUID: cLfahHC7_yz_v2RR1qMnQ4f1oHFw4TgT
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b01d254 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=AVuSvmmuOnOpfVppq-QA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX41wrozrp5Bcn
 ChrvwI5jtkSbUqC0OoQKEB+WSGV0D+7vYIZ6GXt/GRgmv+rT346XM3jhrT+MgDm+dOY8FkFFuKs
 nhsNBwGMKlD9zt6hZ70bcarPxItLklBJ8JXR9dCgd6PHc9lEB9bD1bdSydIBYygraGRLM96Z8PN
 uH/oJdUUTMEDzH6gYRr2LmqfiPft6+LGGk989NI8QZwV2hWgHJ+uS8l4+5NiM+/FNX8tTz0RFA9
 AWTaHPUyA+rnfKJocpvbcsbGPvmIu5LiXJYYxtiCGv0PfAywYcVgMQGqaI6JKfqnYMcssOXA5kG
 iiZkcrBmNde2pqaapnWstIeanYi+XSeEWa1dbCXfNAsTYhL50lTtgkHJdJu5VkI5cPfekcH9J8K
 ZsIbIsloK7XhuY/uhLmcZ7ZUKo3athYVgWwlF6P04JpH1W2EbRfClHwsR1InCau48b+C8rK/mq+
 TBQO8CQ8AQR7gyZY/XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210068

On 26-11-21 11:36:16, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 10:35:27AM +0200, Abel Vesa wrote:
> > On 26-11-19 10:51:25, Griffin Kroah-Hartman wrote:
> > > Update the node for the DW9800K for correctness.
> > > 
> > > Now we correctly select SAC3 mode and enable timing-control with the newly
> > > updated device tree bindings.
> > > 
> > > This is a breaking change for a part that was previously functioning,
> > > but only due to manual register writes in the driver. Now that we have
> > > the correct documentation we are able to update everything to ensure
> > > functionality with other devices using this part.
> > > 
> > > Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> > 
> > With Fixes tag addeed:
> 
> Why? The DTS if backported without drivers, e.g. by other projects,
> would stop working, no?

Hm, I guess you are right. It doesn't fix a functional issue. It only
fixes initial broken design. So no fixes tag then.

Thanks for spotting this.

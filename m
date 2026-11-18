Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992542;
	b=zSeM3Mqyg16xwqb8EtCLPV12/w/t5qTMreuRF+zCKfeOAlOBtGpxayc+lPy4okTMw8jl
	 ZkoB15AzGy9Yi/eFkSWlzYi6rKlqkju8O7MexxdXeUVAcesnajuR8/AKDJAvwraNvkbjR
	 Kin00phtr9P6qLVEe9NyUkxW+PEo/LwbHZHpOn2J877Ga2/xUO5k2QeyLrVSJinmdQ8yc
	 nQRrPYIuBczyEsFPKC8f1lBHpQ/4eNpRtj/ZGA8F+q1thu/k6uGn4wr8A5w9MFlmZA/oZ
	 ULjLszSjZAy3Vc8ctLhLCZxmezoegR8JS/Ur0cUIic5yNw4GWyFkxRKbp5fFVnmJWyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
	b=jk0t5IgBWfW3vHX1/3hOyRTIqxRhpLErn6PJK6QsK2YlLcPJT9f8rHUrlofmMUfmQc8B
	 vgMSzJwvFb32S0JBexbSWoeg3Y7ppTX+pRH7l3m/r44VzzNbPH2r1fdM5NY7E1dBPj2Ic
	 L9W6n8wt7eql79IgiiFY2uc6cO7Y2HW4qMdudXn/QHjtsVTOzBTxwbpLTQC08VUbFe4iF
	 7YbMbmcK11nSgFn96WwA9K64jr4D3aEbQL6OC+iYwCRh8Bnjz5YjiKhM4msV5v1T/86w3
	 Fn9QTEDSoj8AIM1Xlk0uEFTlcrrJPLsTBuCNvhey8kV0dPl4yb+XiCF+nBvP8UqrPag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fa/9Iryi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpcbNdbX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FB9606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FB9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fa/9Iryi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpcbNdbX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8NvK12383140
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yyZLaNLsFBfc0JqArcrGxcWE
	FwZyPv7YYEvEtfwd+rk=; b=Fa/9IryizRttAHlUczN/6wai6NYxknNzBYBuBmRe
	NDt4VFh45iJ7hI+MPeJ4R2GM9riVStt4nxDR4y7MF60N1Ilg1hozREdZGUO/fea6
	FRVcg/9sS6c4ubwFp60b1dTvcV7OO09I89EJoCIRlrBZ0+ZFgUyV9SbuDmcZSYYo
	rzmubtC6D0DlMC9+7Ql+yf8bUi8vhMzgK4fl0sJ+nkqlv4xYprIv+z6ZrM0V9DBK
	mP4Pr19Ez5j2LwV4H58BGr/7PMfNz48w1KDCre8iWrNi1C0KtSXiJOvjs05senUV
	px8XfQEY9nsOAUQGfpxynRuWxEeFTTKo2d33wfGYtWyGxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvat78u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:02:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso161460385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992539; x=1795597339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
        b=QpcbNdbXVAbvQf6A9ENt/h49FPzl5txSRygm7X9prgCe4XjomdrNC3kn2bDybgUCN4
         Db8+28s+VaNdkzB21+qwfZ4L4VvjJ7g6H1f23gRPTuMBEQ7ZN8jaIo/uF8Koe3yHy7kb
         0ZF2pDovxkD2mg+yyAKvmS03KsEh0nGrZkWahT6IjQlr1uCUfPuJ2FVriUL8Wap9Prqu
         bgnN0MHUhQeaHCtkGfKtKDLR3pQVAENWpxo5oCJ51m6rXtsPYMDd5kW5xTTvi4fbtPTX
         eVXUqrf1+/KC+b9XmSwEtD7cPZShnyXu7RcoNbszYhrKwH9M2axOTZqlH0NUQmZCsoJW
         IXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992539; x=1795597339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
        b=XB0F/G7mo0eHPmVhcjuu8esO7sLBg3u7grvi/oemu8yP5qw8vybvoW95Ihy/+xc2cZ
         V15zTEuQLyFFh8p29sCqjAtcZkmfdrY3HnA6o4eLXkK652w4gxEDrEeIWJWk3fxXrWW6
         sA0GEmlAuzdcYuUHr18bWKcEVosFKqNyC3Vh8PysD7ZzjB4HdT6BlEz0FRmHKBmII4Tw
         aEoZUUiAxutEiu6CSSlRG3kX0AA3kN29N/q2c3l6mQBfZ6MGEdtcmnLVTKqIobuSzin9
         V5IZ3tztnwIeKXUTWXvvgRB912Xl470RqWNGuYu3XTJz0jr8TI1Y5IsXjj+N9ldBSajm
         wAjA==
X-Forwarded-Encrypted: i=1; AL+hErH28VotUbqmt8EXFBPAHF5vl3hxz+/nwxAmWTvhVhzv9BmvwCPjp5KXzMr34+UDqiRtRhC8NK9n8YaHAwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cJHxGWrRkOTcxl533++8VpTGDXpD1iHvbw4HeFGXtzZqq2dPs
	musPK39x1Az/JJ38Adj64q6CnETlWUIh2YXRalySVFEhSwvXEqj+y2RZkHtI3RmB7xoFrWjvdib
	4YaWgNsvxVnt2ajG/7/vMpQ2ZlV01vA5EsClzxHMR6SlnWEBj0DOax8aqZP+eVz81P5g=
X-Gm-Gg: AYBFou1o9oRQHARnNoImSol5tDSj6ujGjWw88StwCM5LBNmU3YF3a1Esd0xFy4YObMp
	VTzkvA5hHtK0duklKk7tTt34lfUGBDITi3lVId9jb7dKf51OT9wlXkBL+Vdq3ovGApT8yWVrDuR
	RTobw1GxzxTUv6ihi4RJcsALLBijDFZ+emI02F2jHvljdr+zMLhttekzwa0Rv+Jzj0WJ2TmyrP5
	MtORUnQ/q+9n/Evi+2Anu0G6Nr690YQtvYh29jIA8NQ4h142RWwm3bUqUArw4AnA1OKoj+o4VlV
	vsCzSiCfvgioa7H07oWBlY1IvyqVRMzah/0H47GJ/MPShWUE0b693sDe8ykwa5IX1Tq1JOiV0yL
	xQhsk/d77DKuyHGXRFOzGx14n7uy2HB792Lx7k8gq6sYG4JPUpUcZOQJwOiME61cDRw7out/5kc
	a8MmYvyZPPmS9aiXLyLlgb0Z1cl45Qb3Sn+jOCPff1kdnldGhl/sQZ3cNO2IT5jw==
X-Received: by 2002:a05:620a:628b:b0:93f:2c95:658c with SMTP id af79cd13be357-9499957e6famr377684085a.14.1794992539395;
        Wed, 18 Nov 2026 01:02:19 -0800 (PST)
X-Received: by 2002:a05:620a:628b:b0:93f:2c95:658c with SMTP id af79cd13be357-9499957e6famr377675585a.14.1794992538630;
        Wed, 18 Nov 2026 01:02:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae67b429d7sm4551491fa.36.2026.11.18.01.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:02:16 -0800 (PST)
Date: Wed, 18 Nov 2026 11:02:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
Message-ID: <vwg74npvbwdhepp4uownnzlj2ybpiknfktfvrpy6462rdw7snd@tj4vgnn3dtml>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
 <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
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
In-Reply-To: <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd699c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ypECYpogRKzTefqxK8cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TxFxJAFmkx6bxelCL71Pk1btQfPET2fd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfXzu6vbRG1djYq
 +hbaAy98UDBe/LSbkIi8MUeawRummIzfZ11N0PYnQj5RjT4dGCuuP2lnFvw9+nt+lkhqkICayh5
 xyg5J6AuxiYMkiEeWqbDJTdxhH1BCa3MAN45wTTD61MKMOAWl57KzplYf5Gbc1zxdF7+M6PiGcz
 tTm/ZZrevdNLvBbphYWNNKJ1ZPCypvnEJBKJ7dI7JU6TO9+VygGaz3wCg/whvbp649y4Qh8DKO+
 0RokjkeuXXuMFgxFbljQdKk71UfZ1ChksNYroOZo5JP1r6ZqLZCYpAcFe3aDvx2OYy+whPfueZ+
 vGLjcbk3OR/e8hV4VgPyAWouENC3GJBmPA0/Svt5JsEjSo1TxBLHhX2MW8IWLD6aUXSMqoKWHpJ
 WeBjnuPhQ+g+45K1Suv7DpH4lMNyfR99Cv7qc36yAX7PAFBKaKiXHxrmR3ZCRJolh9We/HUW52h
 QmVJiI+OLQEDrNy3e1Q==
X-Proofpoint-ORIG-GUID: TxFxJAFmkx6bxelCL71Pk1btQfPET2fd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX6TwshkFmhrBE
 +Mj4yrrVc54M9OFxN6lRy1wwWuJrD5rZvm7fF6O89zCpWAiDdmCI4yl1rh2gcUKRnjsXkPAOLD3
 CeVvjA+bvEvoROmJDW1mzGMR5zl8le8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180035

On Thu, Nov 12, 2026 at 07:10:38PM +0530, Vikash Garodia wrote:
> 
> On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
> > > The OF_IOMMU code relies on OF address parsing helpers, but the
> > > dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
> > > of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
> > > annotation to handle configurations where OF_ADDRESS is disabled.
> > > 
> > > Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
> > > preprocessor guards and __maybe_unused annotation.
> > 
> > Why? What's the problem that you are solving? Why is the current code
> > bad?
> > 
> 
> The commit describes the problem as "The OF_IOMMU code relies on OF address
> parsing helpers, but the dependency on OF_ADDRESS is not expressed in
> Kconfig"...and instead the code had checks for config or __maybe_unused for
> cases like sparc.

What is wrong with this approach? What is the problem? There is one, but
please state it in the commit message. Something is wrong, otherwise you
wouldn't be fixing it.

> 
> It was discussed in prior rev
> https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/

That's fine, but the reason must be capturedd

> 
> Regards,
> Vikash
> > > 
> > > The only architecture supporting OF without OF_ADDRESS is SPARC, which
> > > does not use OF_IOMMU, so no functional change is intended.
> > > 
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/Kconfig    | 2 +-
> > >   drivers/iommu/of_iommu.c | 4 +---
> > >   2 files changed, 2 insertions(+), 4 deletions(-)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

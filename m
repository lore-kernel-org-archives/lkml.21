Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527977;
	b=gU0p8HrbMsWjM/BFkTUhR93to3TISl45FdOxAZy/20IWaLxHg8kZz/U7nLiSTAVHxroW
	 RhZo2A2QdKQ18QUasrBP3+niti6l17THFsxmJXvv9ti5p9EqRZB/S/TK4/hJYSIqELrMh
	 0q9cIapjs2O6lJFK368nGU9K/QNdggDjLOhb/rhNof3urf4qAkXMkGcT/zumcJofxTPAK
	 nNNJ2D0KrdcyHtmluH79PZ342zpurPQJnLE7xKzPL1qrHOa+t3EIJ0gRxyxqtanBoSCoC
	 hOgZIYRPAObg1+VMjqOG+kO3iFxGCRE461q1t+znHKXm1HyavyHc6enjwSsRNzcNxyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zPbiw4ZB1gHphClGjdjeA4UlOcJJr69dzbBrC67QfsM=;
	b=wSdE6OGQZ4lmb0X9z1dW97HGv04+VXWM1aa5tj6P4QN3tFMIhjAusZD5x8m6vKCnWD12
	 Wa6duJEVdWCBoERLXL5s3uUCoC2iTdBuMQv9dDjdZp3yyVQ8Y6iPQjW0W8cX6JegKqMPZ
	 FYewUzZUCrzSTcXzZ/iQ+0A7itzxmmaquZySu8huiDZ+3OYMdHrn3qu21dqHRpUYOWmpD
	 /Y1BSAGff6GBYjaALXR2VA5mKPKJpJ4/kwuKW5/7lTQQvZmQ3lXtJLknnVLMpUDKExjwT
	 KU+v65n+SuQOj/aIMbw1L9bVl6XZFwI9BcgYwFRfL5V3hvbpdPAswf7I/2iMmKVh0aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJrGOuW5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBsIl43z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED76606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED76606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJrGOuW5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBsIl43z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuVF61736766
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zPbiw4ZB1gHphClGjdjeA4Ul
	OcJJr69dzbBrC67QfsM=; b=hJrGOuW5YBaVut9iXn7lGp7xYi/OmdTQQ8JEOixM
	kwf4pcVmkssjx8VSeXYLKSSYgKMPwoNJvSGG8jOQNbhFQqV2/FcJwyzxyZStABas
	MF6J2mZswzBqX0MaeCj4Wg2/ktASqG+2r73J1Rr7+Ju7FKudyffLz994scEuTGU8
	YB89zZfCFMrbGOm+KqQbzzeS4BQVxVjCQM7Dl3oFv0+WvGgE2ULnDitpxER9lIWI
	go/tXT+iY3pw99H22AN7oOGmx+ELK6c9BDX1vSLYDaPRJnz3gjjSws3lO+nFGqsJ
	Zyc8vYxyqMU1MFQ7/oWEz6pILy5a3SuQ4QmE+DB0jLn/sg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd33mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:46:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so11957492eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527974; x=1796132774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPbiw4ZB1gHphClGjdjeA4UlOcJJr69dzbBrC67QfsM=;
        b=HBsIl43zc2eV5m7cmOVSTp8zWSm9HRvgiqyLBmR2iFgSWKAsdlWxNPLXAUNR2yYTtL
         04XJgKLC9Bmz/YXOYlbUOSwAE4ldrzaRna2xLWXZSiYb6fBpF5xmQNtb0nJcqa3RwdFX
         khoLe4M6qcsZhYy1g8sM4BzA9iTtyIO8GAh7ArsyuMXZoBTiA942WnDCZZNjPDeIh5ff
         pkfe2y5fQcUI3En2h/OA4a3h9xMd6IKnqJ8oKzSBdQyeTn0/1UXUS3+KZwDjz2FP0EhB
         zyPCU4wiyRk7EMttNKhf2G5r2RypNtvcILw2gxvg9f2DDYaxg7RJpUG3rxEA3e5yVQmd
         c+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527974; x=1796132774;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPbiw4ZB1gHphClGjdjeA4UlOcJJr69dzbBrC67QfsM=;
        b=f+Msbx0vKL2BDFcVSxv/yoMR4VsRXG/Ceg9MdlYpHuvE+E2hv02BEcGtk+Mn4lLf9q
         kJMw4g+w4QOt9TcGjX5yBjjOaHKEVmdnY6sf3utj6ADWjMBfEzzGlaHLAA3bYXnh2ZOs
         R1l4VI9IcBJFJgOct60YcRw+e8NVwmen9giNOSonKOXRWDW1DgDYlL8EX/utAtUyAk7q
         mLnvP8zVyUPkj+8xvtYHkTjP/V6k2N/IH9BrsoDGUWmIKr8doYHCLmwW2A8hpoJmAewJ
         DIyvvaBwDBugOP+D7aEM1Uoku8RSqK4VPV4ZzD7omHKfGs8KplHikL7+2Xb+AvnrjZmU
         vW4A==
X-Forwarded-Encrypted: i=1; AL+hErGUqnmJcpdMnrqUSc7UMTzmVfyHgWACSFpZdy2I6X5cxcFRY0weY0VexXQSvFcw+btduvZQ/IweSuHvuTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dRe3YwwrzcpmXJQ2eWoH0iNmBOMafpMAXWEg9z06O4T2uPbdP
	7uh8h2cZo7msDpbT1tOGntgESTyViP7ZZ3Iz9JP8mFL8jqp3sFZbQTy7zo78ZfDD+ge5+hK59II
	utlIPAJmHNrydu3lh+tNzT7oK+k53eucbxRzrrQdTphuWMYm6dVn0MYgicW8JkYdiUsE=
X-Gm-Gg: AZFdTZfvMt9GyohnvWDqsWJUraRvuou8pGCmSEyb1gRdMhZg0kH0L50TKne9Z/AKYQM
	YWYteDEPintwsmy2yswpQ2wAdA+ekKTmeNMyjd7DgDjqjkl+EcLZK5vwQb2Ru/1KHyDlAHYkJU6
	sMfowwuzyRrwZzLf9IlwLeOuSKo91nlydDXAndUt2mOIodiVFs0dKa9QWFYUS+MM4u8G9JLMr0K
	ZkQkDdz2FvVSm7BV8eTwh7cnqxM6cVw64ahRk0Gs5wrN1PiOdsjUA8sy5G/brSQ3ySjWHI/gkLX
	R2Gag3feHPbKpCNIJW0S81A7b3coShVZFVhLOGc/Z7yuM98ki+bFlwlszXAJuVhhJTDFPShxxI9
	eL5DQz85R3hjeMHHorAFZlHHvmzYq9aA8tkkJtXha3Lz+V9SUVd6erbg2x2N2NXJU8/0db9GVdT
	Qmx8CI3/Qs9RsopZHR
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr18149369eec.12.1795527973960;
        Tue, 24 Nov 2026 05:46:13 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr18149346eec.12.1795527973410;
        Tue, 24 Nov 2026 05:46:13 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm33790831eec.1.2026.11.24.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:46:13 -0800 (PST)
Date: Tue, 24 Nov 2026 21:46:08 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Mask PARF_INT_ALL_3 events on Nord
Message-ID: <awWVIGmkGzyVL89N@QCOM-aGQu4IUr3Y>
References: <20261114084700.907031-1-shengchao.guo@oss.qualcomm.com>
 <179492110006.194330.16578214355369868159.b4-reply@b4>
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
In-Reply-To: <179492110006.194330.16578214355369868159.b4-reply@b4>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b059527 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GkseLWfAocwtZgMctr0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MyBTYWx0ZWRfXzqNfLt+i5g1p
 pMHfapnqBmtZs/93vMEqTgMCRoNo4c4CoAmI3Yqcxb9TJc87GxpUB2+qgpKYGw65TA7lSLuPzQz
 Qry065skWNfRVzFB4gxe2p/egtz62EEjdsL7UJiXq0oqcUFTH/SrOQUNxiJ+SCTXRvjw96Kmrmy
 EJ1QWN1Pywnmdki7htTJ7rvuiG/6doZYh59Dc6djCbGAyM9sQG92PSzSPH+cnU/vcnMeNGhrQMp
 sjDXRdL2ImKhGAhqQ8i9moFHD4H1esm2pDwQy2wQ8eEDSRQa9YxSyXoKr4fcq58pMShLOovBGhS
 3SRFZGq0M/bt23bt7bmdZvAZ4HYoLj3BUDUAgIvRqqtf6Q5udtd8yz/BNa1duQd6d5KgbiB5Rw9
 EUn8ZjFXoW9Y0B/VrGbgDr6MZAw40VbNiJs+v/obTeAnGk7H1QfU7tB5qclw7+RNFaPkeFLNZzP
 HB965QzbdmHbsOMfDpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MyBTYWx0ZWRfXy2HXNTHe00R6
 hjSarJLYuDP0zGR+vcOP5ku8FpwYyl608QUv/SDFjIL++p6h8cZqsSxwsFP7VZ98xqHA6FQ9Ayd
 WJ5l3nm5xmi/6LdyCskyWyBuXmJ9dEE=
X-Proofpoint-ORIG-GUID: tAzNSrOcbdYoF6nGFEikqN48935dVAPo
X-Proofpoint-GUID: tAzNSrOcbdYoF6nGFEikqN48935dVAPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240053

On Tue, Nov 17, 2026 at 02:11:40PM +0100, Manivannan Sadhasivam wrote:
> On 2026-11-14 16:47 +0800, Shawn Guo wrote:
> > On Nord, the PARF_INT_ALL_3 interrupt group is unmasked out of reset
> > (PARF_INT_ALL_3_MASK reads 0x43fff), and its events are routed to the
> > same 'global' IRQ as PARF_INT_ALL. The driver neither handles nor clears
> > any of them, and the global IRQ handler only looks at
> > PARF_INT_ALL_STATUS.
> > 
> > Some endpoints send a Device Readiness Status (DRS) message after link
> > up, e.g. the SK hynix HFS001TFM9X186N NVMe drive (1c5c:1069). This
> > latches DRS_MSG_RECEIVED (bit 12) in PARF_INT_ALL_3_STATUS and keeps
> > the level triggered global IRQ asserted. The threaded handler then runs
> > in a tight loop with PARF_INT_ALL_STATUS reading 0, starving other work
> > and stalling the boot (RCU/SRCU stall warnings).
> > 
> > Mask all PARF_INT_ALL_3 events and clear any latched status on Nord,
> > before the global IRQ is requested in probe and again in
> > qcom_pcie_reset_root_port(), since the register is reset together with
> > PARF_INT_ALL_MASK. To keep the two writes together, move the
> > PARF_INT_ALL_MASK programming in probe into the same helper, which now
> > runs right before devm_request_threaded_irq() instead of after it.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Missing Fixes tag.

Will add:

Fixes: f75d2d64fff1 ("PCI: qcom: Add Nord PCIe controller support")

> 
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++-----
> >  1 file changed, 25 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index eba1b2cb30f0..03b2e61fc20f 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -73,6 +73,8 @@
> >  #define PARF_DEVICE_TYPE			0x1000
> >  #define PARF_BDF_TO_SID_TABLE_N			0x2000
> >  #define PARF_BDF_TO_SID_CFG			0x2c00
> > +#define PARF_INT_ALL_3_MASK			0x2d8c
> > +#define PARF_INT_ALL_3_CLEAR			0x2d90
> >  
> >  /*
> >   * Outbound blocker range registers. The blocked range has a write pair
> > @@ -294,6 +296,8 @@ struct qcom_pcie_ops {
> >    * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
> >    * snooping
> >    * @firmware_managed: Set if the Root Complex is firmware managed
> > +  * @mask_int_all_3: Mask PARF_INT_ALL_3 events, which are unmasked by default
> > +  * and would otherwise keep the 'global' IRQ asserted
> 
> Reword the last line to 'and are not handled by the driver'.

Ack.

> 
> >    */
> >  struct qcom_pcie_cfg {
> >  	const struct qcom_pcie_ops *ops;
> > @@ -301,6 +305,7 @@ struct qcom_pcie_cfg {
> >  	bool firmware_managed;
> >  	bool no_l0s;
> >  	bool disable_cgc;
> > +	bool mask_int_all_3;
> >  };
> >  
> >  struct qcom_pcie_perst {
> > @@ -1738,6 +1743,7 @@ static const struct qcom_pcie_cfg cfg_nord = {
> >  	.override_no_snoop = true,
> >  	.no_l0s = true,
> >  	.disable_cgc = true,
> > +	.mask_int_all_3 = true,
> >  };
> >  
> >  static const struct qcom_pcie_cfg cfg_sc8280xp = {
> > @@ -1871,6 +1877,22 @@ static int qcom_pcie_set_max_opp(struct device *dev)
> >  	return ret;
> >  }
> >  
> > +static void qcom_pcie_enable_global_irq_events(struct qcom_pcie *pcie)
> > +{
> > +	/*
> > +	 * The PARF_INT_ALL_3 events (e.g. DRS_MSG_RECEIVED) are unmasked by
> > +	 * default, but not handled by the driver. Once latched, they keep the
> > +	 * level triggered 'global' IRQ asserted, so mask and clear them.
> > +	 */
> 
> This comment can be dropped.
> 
> > +	if (pcie->cfg->mask_int_all_3) {
> > +		writel_relaxed(0, pcie->parf + PARF_INT_ALL_3_MASK);
> > +		writel_relaxed(~0U, pcie->parf + PARF_INT_ALL_3_CLEAR);
> > +	}
> > +
> > +	writel_relaxed(PARF_INT_ALL_LINK_DOWN | PARF_INT_MSI_DEV_0_7,
> > +		       pcie->parf + PARF_INT_ALL_MASK);
> > +}
> > +
> >  /*
> >   * Qcom PCIe controllers only support one Root Port per controller instance. So
> >   * this function ignores the 'pci_dev' associated with the Root Port and just
> > @@ -1928,8 +1950,7 @@ static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
> >  	 * non-sticky.
> >  	 */
> >  	if (pcie->global_irq)
> > -		writel_relaxed(PARF_INT_ALL_LINK_DOWN | PARF_INT_MSI_DEV_0_7,
> > -				pcie->parf + PARF_INT_ALL_MASK);
> > +		qcom_pcie_enable_global_irq_events(pcie);
> >  
> >  	qcom_pcie_start_link(pci);
> >  
> > @@ -2429,6 +2450,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >  			goto err_host_deinit;
> >  		}
> >  
> > +		qcom_pcie_enable_global_irq_events(pcie);
> 
> You should not enable interrupts before registering handler. So you'd have to
> mask and clear here and keep the enable where it was. This means, you don't need
> a helper at all.

Right, unmasking PARF_INT_ALL_MASK before devm_request_threaded_irq() is
wrong. Will drop the helper and leave both PARF_INT_ALL_MASK writes as
they are today.

Before I send v2, I'd like to check where the PARF_INT_ALL_3 masking
should go. Masking only in probe and qcom_pcie_reset_root_port() misses
system resume. When the controller is powered down in suspend,
qcom_pcie_resume_noirq() goes through dw_pcie_resume_noirq() ->
qcom_pcie_host_init(), which resets the core just as
qcom_pcie_reset_root_port() does. I checked this on Nord RRD:
PARF_INT_ALL_3_MASK reads 0 after probe, and reads 0x43fff (the reset
value) after an s2idle cycle in which the link went through L2 and was
re-trained. A DRS message after that would wedge the global IRQ again.

So I'd rather mask and clear PARF_INT_ALL_3 in qcom_pcie_host_init(),
right after ops->post_init():

        if (pcie->cfg->mask_int_all_3) {
                writel_relaxed(0, pcie->parf + PARF_INT_ALL_3_MASK);
                writel_relaxed(~0U, pcie->parf + PARF_INT_ALL_3_CLEAR);
        }

That one place covers probe (dw_pcie_host_init() runs before the global
IRQ is requested), qcom_pcie_reset_root_port() and resume. It also runs
before PERST# deassert, so the mask is in place before the endpoint can
send DRS, and no helper is needed.

Does that work for you?

Shawn

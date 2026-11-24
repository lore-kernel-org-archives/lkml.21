Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536168;
	b=hD1sLX7gspe2vKbFavW8khkqIQukDxetcS1FU2riDJ+4qhRhx4E/Fjpe0w/EbemFpV1b
	 UqmSzRos4vKND4fGz2R9HBLpGHkyDTQiQTdDkg+XjWrwnrUgxSQbOqhM7R171B7KGEYem
	 H7JQjd/ZFrNH8EqlzVHMdmtr6GwX6iFKp0JK0y+V0zRSIxs7iFs+susAwXFbMEFh6PDDb
	 ARV6j+HNPlzFh58mmydnCvPsTVobPsuiR13rC/ilrkYSV6Ot94aapcYmAEymqtmys9AHo
	 6BdzXfXNvTTSoXGbbbdFmhbeEKtqqwficSLR427jxUDe6oBespexVrnkclIlLOpM+xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
	b=DWhFcL2mnGJhDHzOnurtETJKFicNf0wOwbdlMCWBSAfK+FirCCcsKmy4FmHFsZKVtMX5
	 iowHkHYdDCSs5TQxtEqJvB3PtULd0f8p6GjauKPPbGEt0B08kz16oMqg05QjO9aRMpQhp
	 qm05NNlChkSgyDfWt6mDRbILgQ2g02Xh3gEJRTVUTvWAgbWGcD9BO5dIgsCujeE9NSXPz
	 GhwBMH0xDiCcaEJlgWU8C2k1etwJO++IubejmCYf+JJwEtU1EAs+AiB4QalC41c3CNrgh
	 pf3rLxbDC+NNALqDj6AZ0PW7UeKMltlP7DDOscP5HMHrvpbj3ijo+HqeH2tIXPLeA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9lk5BOf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6804606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6804606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9lk5BOf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL5nM2318041
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7e5IkpeNb6Jnq3ekR9vD1xEn
	To2vym3AHpRb4B0Ibcc=; b=lvK4NXkZVCfaLQE3CerZ13b8vyja8k2emdEbwSCp
	vHLW4KegKzU+SUm3+j8urcgcUUuE52ETu6NFLJmQjjGSWXEgZp38p9T28Bws03+u
	5SSwEIWJzZuMp71ifrUe28tpmZR6mNHQttxtVY6+hcWVEnuOYFS9wji97Xs9T+Ra
	eeyAzwGirdlPf7dRh8e3GJ1wCudn0AtQiKW2ipvSl6BmEBZ7KYbiKkOaVg6Edj4T
	dCKon/cjBNx4fg4qUtLiz5ZcetPeAT0pwkF76torbJ37iyBgl8MWZeMc+yU8ZC3X
	uLEdmh1BVvA4mlMuVDNiE9xShP59pBVtTmB0UeNpBd7dTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd3psw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so4692289eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795536166; x=1796140966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=g9lk5BOfRD0NNrdSlLnTFXx/f2RE7AhWuJ6j/Cedz9jBLIiRB58nTYl1xqigMpRSkc
         6YmXkhdie7b1EKp9TENFN0FvyP0ncXQK/S50zg95FVmGuS6RZT6PqG8yDo9nEYy/fvtv
         QiCsVJM53fGoVsMGsu+gN7dHgCX/LvLa09wygNuuygWwXlzSxNvUIax5jPQUhEuG6fVi
         qdaKRmfEorqVb53uSfFbmilR4r5DVWYu22mw8wEiA8BV8TAMMGMF0pPDPHE5VgwYJF62
         8h92mzNS5yUCpPQFOOxCl+RjoRrurRMgK2zHfssOmATUC/bPSgrgYn3sJk0bpmEAtx6r
         iFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536166; x=1796140966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=oP77Mr7IGTQM8d7FF7YympqPeR20sEE8wGR5sDlWeef6r8Lnft9xi9Brsyunu+ph+u
         mrdXz3wQKSEIgXm8WecgBxNVH7b+7i3Pdcx9sa9PjqGZTw6SoS5a1Azpc8Q1BHb9KfEz
         MSFRmRUP/b5OIIf+dOsBSrY95vAcqau9/2xH3X1I9jhsD+CUtuB+kCq2vpUnW9+GUyef
         VrVeJNkOWJ3Y+1BKr6e/RJZfHNvuzUKkqG39WZW2idzEGtXogypsOfa88Sz8fu0ndQUU
         L46WAJv+QQ2t3qmm/G4J4y82iuaQ3XIt8ZQpixrzaZP5dk276UuR96kUMP9Xojsn6aCO
         5adg==
X-Forwarded-Encrypted: i=1; AL+hErGoRqS2hHSb5pxEfhnFudwMm+GUVFai+c+R3tWl3fycmQ8UC7mCs0OVW8oZUcwIFgAl153MFh754Mm8HCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XF5FrVMk30FhYZUFhvc1rBVAbN/04SMwYGhGsmeSCmj8uAagq
	H5kfBbuRRvWDs9pyeVGRqm8VOCtvoiknDJAHyGHlZxjoyzj6fFco1o5mXdCGk9fzCA9Jyox18cj
	f/3j7xvDkf6phahrUTnVQiOomA1Of115H0ywpRx7nAnuSSxBzCogCzjVBXB8YUl+oagI=
X-Gm-Gg: AZFdTZf5486Wv8A2IBIPvwk5W1weJrhCVh5d9Kig6LE2FJUGbSzAuxXKFicCqbnp7si
	SDWbjcubZbsj+nMDTyxx4wr5eMIhBCeO1CkninN1KvDF8isxv5fZTdw+LkVnjFykd9VDOoLhTU7
	zW35j53BkMidCh18WyGPCAL1fvbH/4xD+ve9T5+0FIN9+58kozC9mL54czSFk8dCidrpzPxh8cM
	gU2vy2ih0BTLBwY1ihIE/IJlGDAxzWvq0677W9y2KyeEHemW0/f/xH6QHVTdKV1PHjlSNqzvEfS
	dMNDxRLjmzLUjygq8tUrkmvzzD3ITWE6ZULuoopP0JisvrLDJtzY2sfbrnX/+rHdfqmS4Iy9ZFK
	xsGbdKPZjiKKjiwg0MKBiPs6fUazFB3sdVsVYGAEdQH1Ln0xBtC9bjE/QbD/ZQQ==
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168430c88.32.1795536165195;
        Tue, 24 Nov 2026 08:02:45 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168384c88.32.1795536164374;
        Tue, 24 Nov 2026 08:02:44 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm51670984eec.24.2026.11.24.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:02:43 -0800 (PST)
Date: Tue, 24 Nov 2026 21:32:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Message-ID: <awW1G1Aou/65UZ89@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
 <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
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
In-Reply-To: <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05b526 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=kppLnbNoFjUBNF5CwvgA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX6gt1JbEdYMvG
 55WQNF94MbnX4t0scGPVKt9ihv7PMd/ZKDoDSFFGhl0B6l4/aGT2TyzdUnEFK8rV/c8PP3s77lk
 cDdjUYGJwo9fJt84mvjAGYfdFxqzFQ2EtqWDBnDIdwFdu1c19sb8IQgRAtfLKM7Fhlw2tU3NOIG
 3Dvo+WQB7ufXJVvcQLamNUShi9r4a0Ps5pQUQa1GmDNx2kMCz5Vm8FEeFeVqW/P8jNDKdHBGqX3
 X9gn5nZgrWInCkKckPbfxALStbriQdGCumpwmH2mjLVFhBNqv6OoHieSwF57wI+kjf+qQvcoD3r
 plGAnK87sTj+DLrysE2GJsCTgjBHRr77chVDoxJ30K9sp7TGxoK3zCsQCXV3z/QEERbOY/bxV6T
 5474pdWebSF+Ul3j2oeoOjnwJtQvDNhwm9gQkQJbY5M3cEvMPVYFCyzWf9VIhKCokMEt0rpji20
 15cYeMPoZL2htCs7jCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX4BPLRJsLLfq+
 e2NrNx1NKCIcYbXAJNj3v5GkYrPrH525cuszgqzep1XcqamCchBmx1T4RTQTQeeOk2U06ystysD
 Y+sQYHic6BIRvVr46aZpUn3nqrH7RBg=
X-Proofpoint-ORIG-GUID: 50My5Cmmr-sFigK1-lf2Zef2wNZljyKX
X-Proofpoint-GUID: 50My5Cmmr-sFigK1-lf2Zef2wNZljyKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240062

On Mon, Nov 23, 2026 at 09:29:49PM +0100, Andrew Lunn wrote:
> > +&ethernet0 {
> > +	phy-handle = <&hsgmii_phy0>;
> > +	phy-mode = "2500base-x";
> 
> > +		hsgmii_phy0: ethernet-phy@1c {
> 
> Same here. Broken 2500BaseX? Or properly functioning 2500baseX?
> 

Based on my previous experience with Lemans based boards, I think its
the former: overclocked SGMII / broken 2500base-x.

	Ayaan

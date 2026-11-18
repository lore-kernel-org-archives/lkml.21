Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043828;
	b=wiGVUA4pIPlSDz3O/NiOhsAXI+yqxx/FAiEUwQFrr7dquy1YWPvsJeoTvitXbjmEPYIl
	 HiBm4Wzttr8vzihCQJJNtG2QX/4hkxJFTyUW558WPP0pwhJ8hsmfPdnzQ/cmYdd90rQlH
	 TtbIDgnrXDZ8rw0GunhjA5cFMD16MoRI2Xg0wTNv7Q1VDY/ndG8VWKWMk+Wjfc+k9puHe
	 gHyy56V+tcoIaz+wP4q2u4QTldXJPGp1KkXA4pou/Js5Tr0TQXi9qwJnPJt2VCsv78BS2
	 RVL2xRfZqk8m/PCRo+DS2YSXtTjNvs16p8E/tnWEhnkPpwPLBPedSI/Waq0PvYX0t/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
	b=DLsD2bjNiMEmDYXB8uBw+681+gEUbMr5yG1pZEQtJbMpRYc8wxR/WEX0tJ+j/XmexDFj
	 WSGnzJ5nD5FsRJkMGpsXRjOdcupMKInoN/EKj4itPxRfU1j+tpxYEZTqj7dVGH0P/Qs6x
	 ywyPW+RD8hzCTZTwOpIy5Rju3fxo3l5KWPnQ+r9vP7rSB5mOGMNJOY22AkDx1A9SopUfp
	 8wJmhsntFgHi2FF0hqSX6Y7Z8AU7Xcee5Q6Pk6OIu/yw+ErEh4wuY/f1XMjW6tcXA3zsF
	 PAY3I8j7mBFix9PU07doPtjE1PYW9M+Xkd7oOgdpqdYbMItWX9GqSphphk0ARTS5jSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzXoqy9E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UI2Ypq2h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B0606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzXoqy9E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UI2Ypq2h
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDBTE930129
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=; b=WzXoqy9EZ8KUqGzJ
	dXcwQReYR+9nFSrq0rPM9W0S5fsrigFhMcZUm1L203qq4hjYQlupifvfpSbRBWH3
	vx+FjGkIXoIPtxMSEFxD++aCJuLCSgLUrBX1ObLXVHM9EJJdytruqp+W3Ag5vTIK
	qj7ztlV7CjWCKf1lmYEsj5u2oyN7yxYTlk/PQQBGJ4PZGoWt+MALbOv7lewgWnB6
	brOwltFJANKvco4ZYgD2EwVnNsvPBWHucCg0zcUbpZcnoPWLs+S7ADwAtF4k8ABD
	DScPdnZw0l5oTjPjU06QTe3g6geaPCqsdUsQRnwp0PvHfdg6mFtEirwPiAG6I1ki
	FEdSrA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qt0m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:17:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso5592852eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795043827; x=1795648627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
        b=UI2Ypq2hRx0o5VHh0HHrADGqVA56gXypndxS4GBp7vlKiP+kCliO+jvzmn7ubVFxj5
         QEbX5oNTFDY1NjvvvCY3y0uOI4VDDca7nBz4+H48F9qjqkyN0yy/IjYtE5h/FdKyQ0tQ
         T4MIWxCM6904DkcQlv/yut5h7HeAiF5d9BnVMzAzwXkmx45KK6WDRb4dhpnY3AGVRK0D
         P/phK9L+GtfxzuwqKXGXomEM9jYjeAYnCl+o9nwzlyOTs9ZX/Pkvvf/twzvMLRoYu2IA
         dAQMadTd5Xh30RtGlKu1ysJ6AlxcjR1nQPuDahMlovjSWPrw1w2yltM5VHHURnA0A+W6
         35Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043827; x=1795648627;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
        b=VmI/O6DYUrtvcC+T6/rcXfeiSx6TZaXHaImu7HkM8r1J1GKcwN6nO6v99m1GwEqzZk
         D7lAYzqM7x9fVruE7TIeIbBe1KcUCtdl1mlJjvyyb41u6Dq3iFdfj1TWPRs2Nll8uj5d
         t8ghU1j/a9x+QGfPCgl5Pe2PFbs66sHWtS54MlbRoSC0pFhqx9xO9y8pZEl+7Szw7/YA
         I11KS1B15c+ZEc/y0wrTAD2kkmEImiuAtxUyr01ZTxgjb2egddpMXLMvU4m6oKcQ37wu
         m8m4GWVotAJH277xMWlEXmtkKdc2JsMWfzqWPFi+nLVS4O2d6PfpafIfC2/G4JuFgkcL
         vCGw==
X-Forwarded-Encrypted: i=1; AL+hErEfK2bt7IwtN5sX3kn+5g5HzotEI9W5XSAGnMTQl/gOEKg4Cl43T/nH/FmT1lSvSk7a/FjpAdv1CXknqdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KM1fAWMtagtbhrs4w0UUU9XAWhI0fStXhfiyLs82YBUzYBCt4
	UC4aNY60itEDNCQOVKk4C4V7zjz/i8fULLT4T0UHtmTVMI9oUlngPLd4Q0ZigcrFnOkwyAwB/MY
	MK5xG9u7TktbQjw5RTWMcuVz2nzYs1QJthBhZ9n5pYRPdNlEBUAmkBpu1jXt7d/yA0k0=
X-Gm-Gg: AZFdTZc50Dcu/iN0dmztB5O8jfaPfZGJeXjMIQlAo/B6o9YutIFAESopzofIm0tnAaq
	tJrr8r9rw11DzHFY1USQQw57/ybgTHc2p2nIaHnwg9wTtszgicdgtkMtBWkUGUZDpt1t71xkyjL
	VjKAPxerCwq09OKsZzfBZHjk9y5/XhpOndHU6Voi0+niuP76QMOp0aULdpzp03C7Hs7BZz/a7d9
	oNDKwYf+olte4TZJMmzENRNanufEDe6ZNbWFxqPL54HwP+5lnsVnvOcKcsO24ER5vklMyOw975h
	xd/DNKUcqhLZbzNVQZzlf7qhoK/G0sDSFWbmUDmjljRsSc5dH38j+LUEx5gIr4Fd4vT5EW3aYRb
	pmEZTJWlSQsHKGo9P0Ong5M7Ts89RMlDSrdF/bO1c6YcnXRZAyh7oYjvsvi3jXYUmwW3cNP2s6H
	zrjOkusRf1VZFBPbEvLsDWUU5ji5w=
X-Received: by 2002:a05:693c:42c9:b0:36f:a72d:29f with SMTP id 5a478bee46e88-3828111ab25mr3971427eec.34.1795043826782;
        Wed, 18 Nov 2026 15:17:06 -0800 (PST)
X-Received: by 2002:a05:693c:42c9:b0:36f:a72d:29f with SMTP id 5a478bee46e88-3828111ab25mr3971402eec.34.1795043826254;
        Wed, 18 Nov 2026 15:17:06 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm12541673eec.27.2026.11.18.15.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:17:05 -0800 (PST)
Date: Wed, 18 Nov 2026 15:17:01 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
        linux-doc@vger.kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261118151701.00007190@oss.qualcomm.com>
In-Reply-To: <av3w1CbwYxFRPStZ@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261117170709.00002088@oss.qualcomm.com>
	<20261118-poetic-robust-raptor-bcff2b@sudeepholla>
	<20261118093203.000069f1@oss.qualcomm.com>
	<av3w1CbwYxFRPStZ@pluto>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DbLqQiZV55wAV4Oi43_zPRX2t4CYrsBj
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afe31f3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=iv0zGsx7Xu7kTqO63LoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX68pFM64Nfpad
 q113GZvHyAafATlQfUEe6eLWNs9u3ObhShLSLJzpgtfud2xExLiYRfH9waTrS/Ek+6qQgvkIS4u
 b2LRhiQaW/+GsaZ7RxZNRRd3OxUGq5c=
X-Proofpoint-GUID: DbLqQiZV55wAV4Oi43_zPRX2t4CYrsBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX2fiWVTA9VfHl
 zXBurxLsHbHDzaVh9e9I/YRo41OU1y6cF1SdLP0fAcMBlDvC04fIbaXeiT4oCyj9OTXD1fiCrb5
 itY9bx5FBldU8RVwTav0CQHPaZFW5f3QlF+bAjJ+oN8c9Eo/80kZYbNYoTPhtWqywYUzp8ObYj5
 FHOwsQAooINS+GbIJHZiXRQM3yyHo7XW2rSmJrD2UstEG9IIeLyDNhu9/DWJHgcEseByY0P8CWs
 f56PFRGaiSJUuU1LHocF/XDMMez3/OWPDRtkOCL9sHviyGk6u1zn1wiqB0qny4JKlE2IrU9152v
 Rmy+UMfj+yQlEocl/Jaotypaj4WZZkiExuX8yJk0rVFphpry4YkoH77MglQqyRRkKhkbJ7XVfEE
 eVZ4uS7RtZB0kyCpsLk4qPX70qo0e9/iq6vAYPkgfesAcOWx2JjIqOP3mZSKjDCu+yAUqU7XuuC
 +d3n71mmYq8SFIEHgbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180085

On Wed, 18 Nov 2026 18:39:16 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Wed, Nov 18, 2026 at 09:32:03AM -0800, Jonathan Cameron wrote:
> > On Wed, 18 Nov 2026 09:33:44 +0000
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >  =20
> > > On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote: =20
> > > > On Mon,  9 Nov 2026 09:11:46 +0000
> > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > >    =20
> > > > > Hi all,
> > > > >=20
> > > > > [TLDR Summary]
> > > > >  [V15 highlights]
> > > > >  - general cleanup and hardening driven by reviews
> > > > >  - improved TDCF access routines to minimize lost samples under l=
oad
> > > > >  - completed ABI docs
> > > > >=20
> > > > >  [V16 TODO]
> > > > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > > > >=20
> > > > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI pr=
otocol
> > > > > dedicated to System Telemetry.   =20
> > > >=20
> > > > This is one from the family of issues you find when reviewing ones =
own
> > > > (well LLM generated) emulation, realizing it doesn't match the spec,
> > > > and yet works.
> > > >=20
> > > > This works fine without the required SCMI protocol property in ACPI.
> > > > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > > > Platform Design Document. 111115A 1.0
> > > >=20
> > > > Now, in here is an informative statement...
> > > >=20
> > > > Protocols not listed using a property may not be enumerate by the o=
perating system.
> > > >=20
> > > > But they are...=20
> > > >   =20
> > >=20
> > > Correct, I intentionally left that out. I do have a patch that restri=
cts it
> > > strictly to the listed property. However, I held off on pushing it be=
cause of
> > > an issue we saw on an internal test platform.
> > >=20
> > > On that platform, the firmware advertised the protocol to the OSPM vi=
a the
> > > base protocol, even though it wasn't functional at all. Once they rea=
lized
> > > this, they simply dropped the entry from the ACPI SCMI device as a wo=
rkaround
> > > instead of properly fixing the base protocol discovery. While underst=
andable,
> > > relying on that workaround delays proper firmware fixes.
> > >=20
> > > That is why I went with the non-mandatory "may not be" wording. I am =
happy to
> > > merge that restriction patch if a real production platform actually n=
eeds it,
> > > but until then, leaving it open helps catch and fix broken firmware
> > > implementations =F0=9F=98=84. =20
> >=20
> > You can't merge it safely as at a later date because chances are high
> > someone is relying on the current behavior and not presenting that
> > (currently pointless) package in ACPI for some protocol or other.
> >=20
> > I'm fine with a permanent decision not to check this but I don't see it
> > as a thing that can ever change (except maybe now whilst there are not
> > that many platforms out there using it!)
> >  =20
>=20
> Even though the change would be at the transport layer, given that it is
> NOT impacting the Base protocol, cant we anyway quirk it later on based o=
n FW
> vendor/version as an extrema ratio so as to support anyway older FW
> leveraging the current behaviour ? (not ideal I agree...and I have to
> double check what changes could be needed in the quirk framework..)

Quirking after a change is a pain because you only find out that it was
a problem when the regressions shouts start occurring.

I'd quirk the other way and paper over anyone who requires that record
to hid some firmware bug. Their stuff doesn't work today, so no regression!=
 :)
>=20
> Thanks,
> Cristian


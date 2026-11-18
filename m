Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023130;
	b=YaIvBuycc6URk82pNPspbW5DQDwwhr/r3fG/pey6j3KsWpz/QnqEAI75O/sUtJjXotGZ
	 fPqSPUg86FR4jQiUg2UrYbHdNeZmILtoxrflD8KQ8vmPOTnzZWRv9ayzXQULtC2eGkcJM
	 leGkhxeWbte2AO5bgbxIR+zRIVi78Q3dquaTntc4NTNj92zkkLxoK99n6nn9lI4InRDm6
	 q//T7A5Ks+JenHKtmrfTvgfLJjb4suAGFHRdBnZRt6is95yqbQXoPZ5WjgPboOTcuwK5k
	 sSgkP5Zbea/IPquUp6sFkubn/f5kiAQTZL7JQ1h0vY6o5R5j7qLh8XMR3Nm5I2TD9DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=;
	b=s6iG+kD09T/o+s38K2omYez4ff02a3rMBZvVh5LiAov2JHfhnjyvy37nPKA1BeXhDpMB
	 q5CEZsnvlpqn9KQKksxr/q+yCrOJDFkDGiD6tpWz/x4YsfhhFcvlbxpVdcHDP979cieM6
	 UBIz2uujvk4PKmHeNUNvYy0Wqn0jGKrNFVtg7euRJ0TWL+kDlwvWkMyehGxNVKocOgc0G
	 FD9pRVytCTSn4QHpKt3X4kMWqRF3Q2+HUfwBJEzEe3nt1jhyYrxzkT4GdW4i71YImDTO7
	 BEFJMHMYpfTslRRO+V79OGL2hn9skJbDcsVtK2fJA37ZOK9OlE6jq6/66SX3pa3llmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFkwc1Iy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYmHiRSY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9E606A76A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D9E606A76A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFkwc1Iy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYmHiRSY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHG4vb401557
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=; b=pFkwc1Iyuzm6QtDB
	jpsJ240F2OsnqEDyuEM9eL3utOmm39sagvXqEk1Sui825XGU+BgTf1jsT4Y7HC+K
	USyfrnC+eNY7LltVz+nv00s5wEZXbWjT2SmSF+TAEMe+cClCjyR1Jnl1q7OZnPZc
	kghsxF/P/OH3kEMGdkapkioydXTlexe4fLYVy+xli5AwkPdTLhdcKUXKOPpLT9zJ
	xet04GqFXxPV6kHKKudVoccNsnXfRXGcCsD1Qgna+TdHOU3WczSnxzjz5H9jQozY
	P/T+GbLcRBg+RbhjISf2YB45doJUOSzNg9Ud7jKvNdEgPCMoBTi1lemTxk2KpLjW
	7CVkQw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qrr2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:32:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-381dc4b8f40so1496373eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795023128; x=1795627928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=;
        b=DYmHiRSYvGa2j/22qQPBU9+R5TD5sWvJIIIVr5F+SB5O4QEgrasJwlNCufAQNX5UYm
         Di9n8427xArfRH5XDC/JwjgYuubvauN4/JOdcEN5yu8+V/ohV1EPiXx1PKCzgPbUcPy6
         /qsRsrMqntNskxqVbz4r0pXp2KhDmtOZ9spCNhJCRYtlKjiyoNg+7MIRBdT4bCTyHABH
         5PQixdrsoziVV+5/hSbwOsGg1kqqHF04UA2mzVSCI8InkAANxJRvab5tciu/mA1rWEjB
         NoVVRBzV+JfDE0PbC/y/TcHFpT9B4CbZuv9BYQLH42rDnlSpn+gM/yv/gKc4GldeC2g6
         KyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023128; x=1795627928;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=;
        b=pCHLhd2pP5nYXeSPnSsQMUtXMgX8waZ2ajJf+O7aw8ODYZb8GWDZoyu9bJqoG/IlEk
         JTEvH+ft/4A20aO6k1vGYcbbh2KXWiLWD6bgVTPf2OJJ+0kJ9gBn7bUoku7nH2p3ouhH
         88z8PJSe+GbVgcT+E3mw5ITkEwux3RSAn7CALlcgMkVe8sbDxlqEnvdxO5lgKlRybi8C
         7we1eHm2anexZ/7LIeYN5XpI8D9zamJCqubfBnSUk8DNrvRYN+TwgS/Z2U2GY1grFyMm
         WVHLx2ETze9ngII8ywsTQaJKi/J7vsLZ4+ksJJbBH7Czz5W1Dy9BNMgrXbnbsu55+ze2
         rc9Q==
X-Forwarded-Encrypted: i=1; AL+hErE/vm/sDjG9s5wBmL4ToKHrXQBFncd5CalRs+nxyKriEiKTwg2PVC9f0cCsPnwohsOAMp0c7REbyPz79Kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2luSPtZs7tI2/xHLe8JI7BonpBTPz4J/7IWC3jArgc0KTaw4q
	vtlfQdgKOFs6FgCoDHC+IhxT5u+g0zB2NeGivT2tALgLs+ArvnOMtMKIQV34OEVwzy/GYRjlhgq
	0UYQjKqBZUBMC1xgzIxPSmCIXF5NX+C5igxvTfUxx22hzKlFThfxb6bExatzoGplxcW0=
X-Gm-Gg: AZFdTZeRBxBYhdQfMwDvVmde7NtFIYK2RwdjUQ9M156voBsM3eut0eh0Oxqi8hWuAzq
	ZFF0t2pJInG7iXaFWVyM8YXlNNmyLUcw/WvpPbaEHv4L6zTrVxxLySzZfizZRdSU+cEWWRkcrIK
	qPN9XdxqQ2BQ5VhJIKGGlcIXcRe8WuX5Sf2O+FE4b4ptJtayfiqNPDIlawkQiA2P/2VZ2paR66Z
	1rQrhv/EKRaiaKEft44GXioMzXxsQbOOAab8+obbhXEnEqOwoT9roHnEyfvvXRSiFsVDigMk5zf
	7zfaMMoF+v2ZZXpDJWLGr5w3Rjdc5quFhnCOPZ5JbmL/Q2c337B+YOzqfFE3+wMzhZCpb3NSh8t
	TJ3zuH5mmCmUlkU6P4LiwJXnAs/Iek2uEHPU/AChVqQ4vyGaixxG6nndZTjcnpFwbCX5daZH0KV
	Z20xGXfOg0Z7sjLq4CXZfokVdWYEQW
X-Received: by 2002:a05:7300:d210:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-3828181369cmr3425923eec.35.1795023128059;
        Wed, 18 Nov 2026 09:32:08 -0800 (PST)
X-Received: by 2002:a05:7300:d210:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-3828181369cmr3425903eec.35.1795023127474;
        Wed, 18 Nov 2026 09:32:07 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm13849129eec.5.2026.11.18.09.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:32:07 -0800 (PST)
Date: Wed, 18 Nov 2026 09:32:03 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
        linux-doc@vger.kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261118093203.000069f1@oss.qualcomm.com>
In-Reply-To: <20261118-poetic-robust-raptor-bcff2b@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261117170709.00002088@oss.qualcomm.com>
	<20261118-poetic-robust-raptor-bcff2b@sudeepholla>
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
X-Proofpoint-ORIG-GUID: nP4t1UCdhZvEF-AUALZ2gZWQwh_OuDls
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afde118 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=ZJvAkwxlLmQLexqbkCwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfX+Xyena2S33Kt
 M9Fq4s4T3b/bo1pgEn6OycvI+3UGuxKlXLRXqkLh97+S3LXsY/ovr1bFsJjQem4Jzfch6lroH19
 67rLR3vT7QDzhAuqSFFQJM3rFG/dayc=
X-Proofpoint-GUID: nP4t1UCdhZvEF-AUALZ2gZWQwh_OuDls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfX1X4JHF8uD92D
 69bmMI4n+c+QTWMZf0YOfVl4pi6S8lF7Ewm1tMH11fCVAYWrPNOd7R+YRD7b147tOKTg2PhwxAT
 CsRyAbc3jHA2NAWfehfT6/k8pTf8rMty8P/sKVNbiFXGAm02cd7IyDOOZcPrQoxFttgOhqvRZG2
 xRTDi3ZBQU5MzBnpTA/PPBnkoz46vzRJCVuViQUwrPznNXGKpbq3S2yPVwqVhy4gzWazRxRzSQa
 sGLxhy8tyYh8vaQJnDJWwlzV2GSPtYQPQ5ySBIe7oCmwWDneCydgITHTmIDlXq0ItLjw/0z28lu
 a9m9Mzm+RYnRCBHVFNQNcVSCrT7f++O6Hgr0MiUe3qyylBS9f1FRxeF03Cy1HN+D2RKbLZDGsHt
 COKKEJlEC31I48E43KzTyEnNPK/VdFuCijR4CHJFoTvYsi2TVWeTXZWQSa+D3lTj2Gf90JcBXxb
 gMJ8d/WnUyAk50wCxKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180069

On Wed, 18 Nov 2026 09:33:44 +0000
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> > On Mon,  9 Nov 2026 09:11:46 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >  =20
> > > Hi all,
> > >=20
> > > [TLDR Summary]
> > >  [V15 highlights]
> > >  - general cleanup and hardening driven by reviews
> > >  - improved TDCF access routines to minimize lost samples under load
> > >  - completed ABI docs
> > >=20
> > >  [V16 TODO]
> > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > >=20
> > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protoc=
ol
> > > dedicated to System Telemetry. =20
> >=20
> > This is one from the family of issues you find when reviewing ones own
> > (well LLM generated) emulation, realizing it doesn't match the spec,
> > and yet works.
> >=20
> > This works fine without the required SCMI protocol property in ACPI.
> > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > Platform Design Document. 111115A 1.0
> >=20
> > Now, in here is an informative statement...
> >=20
> > Protocols not listed using a property may not be enumerate by the opera=
ting system.
> >=20
> > But they are...=20
> > =20
>=20
> Correct, I intentionally left that out. I do have a patch that restricts =
it
> strictly to the listed property. However, I held off on pushing it becaus=
e of
> an issue we saw on an internal test platform.
>=20
> On that platform, the firmware advertised the protocol to the OSPM via the
> base protocol, even though it wasn't functional at all. Once they realized
> this, they simply dropped the entry from the ACPI SCMI device as a workar=
ound
> instead of properly fixing the base protocol discovery. While understanda=
ble,
> relying on that workaround delays proper firmware fixes.
>=20
> That is why I went with the non-mandatory "may not be" wording. I am happ=
y to
> merge that restriction patch if a real production platform actually needs=
 it,
> but until then, leaving it open helps catch and fix broken firmware
> implementations =F0=9F=98=84.

You can't merge it safely as at a later date because chances are high
someone is relying on the current behavior and not presenting that
(currently pointless) package in ACPI for some protocol or other.

I'm fine with a permanent decision not to check this but I don't see it
as a thing that can ever change (except maybe now whilst there are not
that many platforms out there using it!)

Jonathan

>=20
> > So, obviously we can ignore informative spec lines but that is a pretty=
 strong
> > sentence. I can't immediately think of what would go wrong if we ignore=
d it
> > - maybe we'd not pick an exclusive PCC and fallback to a common one the=
 firmware
> > doesn't want us to use?  But if it doesn't want us to use it why make T=
elemetry
> > discoverable on it.
> >  =20
>=20
> Indeed, falling back to the common channel lets us uncover any underlying
> issues in the firmware implementation. That is the exact scenario we hit =
on
> the test platform, which convinced me to hold back the patch.
>=20
> > Should that be wired through from the ACPI parsing code?
> >  =20
>=20
>=20
> As mentioned, we certainly can, though I'm not sure we should. The "may n=
ot
> be" phrasing simply leaves the choice up to the OSPM rather than mandatin=
g a
> strict restriction.
>=20
> > Anyhow, not something I care that much about but thought I'd call it out
> > as an oddity.
> >  =20
>=20
> Thanks and well spotted. Much appreciated as it brought the information o=
ut
> which otherwise would have just got lost.
>=20


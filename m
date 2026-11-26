Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687275;
	b=1+BudDrZblvXmSnQHXzPeky0b1F8+dBQPooEFEYq1XdV5IM8+mJfu1fgtP01yPOrLltM
	 6nLd6mZcz79tGcfiY7QExCAcSCXlssVnTKSULRBWWPMVczUuSCN6ooRNP9H7hoq/UoAAn
	 NAu6pK3z35diAu2s8OLeS50zSeEyQnR0OeQTCTIRNc8ojIrSmohErP2vKiq1gDeh3icw+
	 AHXzrcvTrT9QaJcLiJGibsxXCZzDq6u6ou5pXZeXeXOT2JacGEVCPh67bjlbAk2cUQKBb
	 gnBq9h7PJNsFygDPdEnHzrvwdnT5uc7YaMpsibU4acf6dj03RlKk1q0i65l/PfVi5uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
	b=QSQ6gP1PTOoUGlkOOd6dbJYUiWpMVcchgPiUdq5Csv28XjFQ5LlFd+x8IVGS7STOsRk3
	 jf503Lm9vOBw5ACgneZPgHcfNd+9UENYOWXlRQ5G3UxYtTdbED9JmYed4yS7OXp14ZRu7
	 qXKCmEbjvBhUMSE2glvRhRDNAb49wauuduUa0gJfUEXD+OwOH8veAm6lfVUDuCm0AV9UY
	 KzsadAnQ3Z83UvtIMYfChZFuP7eQv1h7YN8B4YBxxuGSBzMYFQyf0GPrpU+Bc25mAZOXx
	 Ymy5fF0bXX2783UYXKrfHyhQcGBMOd6meSJPWO673wua6aQTHGaIFB2uGKUB1NoUuhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EeTIK6P+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE23606A688
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE23606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB1XSrRG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EeTIK6P+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Aw9A2175602
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G9iILtelhr8Yu2FohoGwzQk0
	gRPwQeEBjlv06/YSbwE=; b=aB1XSrRG9Tg9EV5Kujh1v5n+6HaPnQH8HSHhBcZB
	DMSIjQjak7kWjuy65DcwYjRRe8EG8HIb/pgErYMbd2yTqRdH8kdfLPWDBP7I74mu
	oAaag5esojBzSIyfydSwLotzVG2E9fxYZH+QbY9TEFZVQkAJ/3HeIKcpFYEEWKO3
	oGClV93Xh4hMwegJtAqsDhBOnZJ3hVZLdcmYJpBN7xpavyJfUNjhiyYOYN7JBKsl
	bQVLQU4xKu/7u2HcFK1513Nw+O53TnM6gj09LynunZ982VnnLYn69kKt9xgaXn9U
	3KetkbIF43Mtywx+0CK+LsFz6k+7qcUOfFHllJAhjgebDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuwaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:01:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so969624985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687273; x=1796292073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=EeTIK6P+VcZ1VOYWJW5F9t6jKcp/LyHQPRdiKsT0LCZs9ZEKzES4HKKyHyUIMraiIb
         XZ2LoM1dMvr9CI97EGJjxUHZ6rgxmOyzdXVwWe90p3tWEeCuQk297wNokYhaoZ/LxOvN
         4mHrOqJcxrJBtzro250SfQ7BfQxfUW0pg5wConBQwzUfximqCke620QwHhFJ0Tyjuqkv
         I959NammX7JV2+Ire2A4n98+rluUUnp7xzPuA7Af/6PvzBOaeywRaSCFyR4mWMzEE+vg
         D5YFzb36Fl/IkFKjOMVe4T+WHswYyYgUbYZTHpHCE01GHsFNv9E9VB4tqRWcnimmVqMA
         EnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687273; x=1796292073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9iILtelhr8Yu2FohoGwzQk0gRPwQeEBjlv06/YSbwE=;
        b=Mhs2YhE06dZ5lQyoyCsQ2CFLixiqjwp8AeyPUHhbxb6zkvWEmBnxkQgMei5n/lH7jK
         lUed37bDNthx+ZQflo9nWZAADyQS+gUJEzKce34tusJuAAheeqIjPmr6QlOy2Dpxqw0L
         Ri5kVJLwk12tyfVI4c1wlEUkZPwU/juQdjJH4FwyEifcSZ6kaLIYeBKKsVdEd0DRf0JK
         8gpkAwQyjvQRxPlmaOEbcWg3Dxnob7gN848hXCWJIqfyu5L7LFrm4opKiQIhf49lO8k9
         blN8B+AOVHb/fJu2mKaev+EGa0AYAFC8tUvUckRgIIsBM1X250GcEaODijyO2L8BD5+2
         dedQ==
X-Forwarded-Encrypted: i=1; AL+hErE43zJn+4BUtZD2Z6HYC+E3CM+0wBrlgPBsXXXDh5O70ZTJLdDOHZ+Bg71LA+5jgsbKMro1xmsXGqFV5q0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q5VXgKE3O3nv5kFdP+2l9LcxdsqC3Qz3F6wfBqrOR6XnKHlWQ
	dWLcqiWsuRnMQHjxY3k00zFbPsxd+S426S1LxZrByZ88AvXuFdCAGFE4naG5Hhw1Ke7WvI1dCvd
	APoc0hU/81aY2OF2c/Dre2qkPn3pdB4HKnOWJzo9kRi1JPmspUlJcu6s+jch1UufyZtY=
X-Gm-Gg: AZFdTZewq0Ued8fahw8tzL63hYt4jdd9Hc+cSQjU4XP5vg+8R3MXgJzBZr3w6xCe4gY
	dnSromkH4VIqDjK31ZBa1pnhouiSQEh/rb7HtHCRIRARI/D2+bOY1HiGXBd1PLvWj7xmaOgTz5A
	t1ucC5PPwJbLyhuDx7p4lUjR/N7hLl+sOdTEDdlzCo0WCQJe3vxmT1ZP+qo6kx8jpD/TwHEQhHE
	H4JYHEshsr36c8zPt640FsydKw5KQnxcJWuZ675VUqqOGurEm/ZIMeCl/02bt3ISwcA/8kKWrmX
	EKmiQILJlA30kgDztImhNG4Rpdm9nMbA7rMwH3s1ZysnnHEMEYAK6REgCyJ8qyZdNzxAfA91nUu
	H4I99QSfZeqRUyLTrAECMV28czGa7p9y1HEOrc2hLxyZWAYDQs+bIJvYp3S3P8d8=
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3557325385a.68.1795687273352;
        Thu, 26 Nov 2026 02:01:13 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr3557251685a.68.1795687266480;
        Thu, 26 Nov 2026 02:01:06 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm38799609f8f.40.2026.11.26.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:01:05 -0800 (PST)
Date: Thu, 26 Nov 2026 11:01:04 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
        abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
Message-ID: <awgDYC5NDhrtYcVW@lore-desk>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fAwCp9gELKVaB6R"
Content-Disposition: inline
In-Reply-To: <20261125202141.1288493-4-elder@riscstar.com>
X-Proofpoint-GUID: FgkAX2--fJMs_iHl8gGmoiR0TG_5Y4O-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX0mdJYl5Wu0fv
 CmfNKlw4RrBlDzIxheeMjTsR4WodTBhaenxp3vbgizopSugPQIburxFQ/EwKTnMbF9hrS8mszh0
 irDTtVgRfSBEtBdmr5SzoYYh89w9x7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXyF8YuJbPiYME
 Xe7vJbEM6AuwvKtLl2bTAR1V0sK3mkqhybXIMrbfcpSCWR+79JBlcSnZ1qj7FG6WrAFqb53CL5R
 sb5ZK6DAk6ssBJFfllpsAYc4rypDBrZT9wxowGWIWZ3aaqtU8EgjwCodFXKZNAmRDYY22koRrQM
 S5nIaTXmphZTInbsw7gpWbQz89fbWoGCeCR+gUSZwJqfF/pXNN6cderm/bnWDxBoteiD1kXy5rt
 u+a2yqrhYtakltcXZAardXOCa3oznUTZg+A202jRKFe2x4gGXaE0oOgkkgVwGCiI3KdToj6oQYG
 bqPSteQQubSHqSQnwNKa6EXARoSYuPr9CkVyKA5xIh2TH6btBxUNZt1dV8/AsY4HpcRUA9dqPeu
 7f6UOCac5hYcGYEKrzvyg0UrF4bCnOadll8pnr8SmTVk1px39kAtA0IhZPf+FzV1mtbCOVX+Izr
 RfITYB9EpIyioAkr9mQ==
X-Proofpoint-ORIG-GUID: FgkAX2--fJMs_iHl8gGmoiR0TG_5Y4O-
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08036a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=DTxt4SQFiI5XT4Iyg4UA:9 a=CjuIK1q_8ugA:10
 a=1mOaCQywVTqKKdqfoSYA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

--2fAwCp9gELKVaB6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add a node for the clock and reset controller found within the
> Toshiba TC9564 SoC.  Also add a node representing the fixed
> rate 25 MHz crystal that supplies the chip.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - This patch was previously not included in the series
>=20
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

>=20
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index 682bcbc0b466b..b327f64885ef2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -890,6 +890,13 @@ pcie@0,0 {
>  		pinctrl-0 =3D <&tc9563_resx_n>;
>  		pinctrl-names =3D "default";
> =20
> +		tc9564_xo_board: clock-25000000 {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <25000000>;
> +			clock-output-names =3D "tc9564_xo_board";
> +		};
> +
>  		pcie1_switch0_dsp1: pcie@1,0 {
>  			reg =3D <0x20800 0x0 0x0 0x0 0x0>;
>  			#address-cells =3D <3>;
> @@ -969,6 +976,14 @@ pci-ep-bus@4 {
>  					#size-cells =3D <1>;
>  					/* Map 0x0-0x1fffff to BAR 4 */
>  					ranges =3D <0x0  0x4 0x0 0x0  0x200000>;
> +
> +					clock-controller@1004 {
> +						compatible =3D "toshiba,tc9564-clock";
> +						reg =3D <0x1004 0x10>;
> +						clocks =3D <&tc9564_xo_board>;
> +						#clock-cells =3D <1>;
> +						#reset-cells =3D <1>;
> +					};
>  				};
>  			};
> =20
> --=20
> 2.53.0
>=20

--2fAwCp9gELKVaB6R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawgDYAAKCRA6cBh0uS2t
rDJeAP0Q6+VXzDX3T4Mxc0he53zTGBAW5n6sPUtB0OuXRO2TaAEAk4D3UlGDtfnO
vcLGfSBOqjIkzTbgYiQdQ6pQ0DDeQAE=
=e1Ov
-----END PGP SIGNATURE-----

--2fAwCp9gELKVaB6R--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650257;
	b=roeIz8Izlw2GUKX4QZsA4rJvAFDzpcDHtEs02vAwb6KXmlpXV1tFwvz/QDnrLsdw0vgi
	 dMyD1nTxYhRuGG9Y8pNTNhaVD7ngBvAczR2VhDVGpK1rBX0EI0NT5bomQzqDDy9z10pdQ
	 RzraaYntG06+/EGV89WDGu19bNgLVj0vzITJjiNkYSxFLz3/wX8OXU84DKW4SXTB2lhGV
	 4ll50YUQtBayuuu98wbTyK0lquP093sn3fwaDsKKkEcZUOx91cMuFSG/aFoU0SkzkaHDG
	 yhYViey0A01lrM0he08dbUUYiRoRpz81r86nXi0jxPTM4udphiRjJEsugCzwVlRN0dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650257;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gWKFhFOVNUQkCwAeCX9zPleQTK8nCcAL4DJhcvfldJ4=;
	b=pgbBJBAfaMHnhtX+J3HlgSL4Z97zQsSRYTlGzqTS7rwOgWXQvpDB+COvCVPAyZAtr2xo
	 m2xE502V8gKBlY//K2LpbKxig2dJeUeDQ9Iv+UrOA2OfAWkdIq4NZ+1408vktTUg4eZ3Q
	 52DkgZ8kSLVpgD8u6Ztt8Mm1Tm1OrlWc9a85uTu5UBOuBrXqzA07HuzajVcqbrf+NBdG9
	 /ly/iRga8SFjzr9rmF4hABp6Qc58CjeBiMPNk0HZv5ye8nxseDu3WX4vdL+WsHdcJCyv6
	 0NpRDUV+fI+uwIBc9ytK+HD/T/5M6egzLiONbeUM+IZlF3uIo8ToWa4wtJZgArOyybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=ds6odARo;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XSa9A3ES;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F76606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F76606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=ds6odARo;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XSa9A3ES
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 211017A0566
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:44:16 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 25 Nov 2026 18:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795650254; x=1795736654; bh=gWKFhFOVNU
	QkCwAeCX9zPleQTK8nCcAL4DJhcvfldJ4=; b=ds6odARoZobKA81khzKoKoDtWR
	KNwKNsTrzpKDEIlD9ks8d4+Gn/fR7tW0JaHDawO+jsFSRZFdjApzGnLDeWc1BggO
	IF+vfXoF7PhYPqBLg11rTPaq6aZylVm1fDQZff3OtmAHKuMnb/0tpUs7uTox3ub1
	8iivJ1GHye5LbEAk+lejmaxnDWooLqQXuzuwrbiL6gGoH3Cu7xrOucRNxvwFVX5C
	xMoRvP9uMmnJCHXePHwEUoj6ciNEHx/cq1PvMBQCxaT7nYr5UVe/syrxe3MO34Ji
	YE5KeP98cxTQrVhGHxHdT9rSEsZYecmYSNJtcxjSe1L2aFatT6U4sHdQUVlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795650254; x=1795736654; bh=gWKFhFOVNUQkCwAeCX9zPleQTK8nCcAL4DJ
	hcvfldJ4=; b=XSa9A3ESv1U4ZcW/XRtZQBvSwAM4rTTr9WEv6GjoTy9rUruwrO3
	DR09VsDLtSol//O4hk/FMZs1aL0bpRUJE6+YcY2omlqaN4lV+Cw39Hv9AOI3a5eY
	T7SdmBYoXsGgEpmV+e6Mim1OIWaPkLm/YThD1CKqCW318fzzkoBsEv0Ge60rv6do
	RzNdTRYMpspxowjrF5Co3QkzTeNETqz07E5VP6Kor4Y5z6DPp5A5yiUETJOusQ0D
	irlvCWgXfBOpGWr7HON+zLLFKfsZz6pMJ4CFRzhowSl4Z0YISEUq4oVaOWoEAkZM
	bdgFTzGl0IaGZpF+2BzPbC2a+kw2ngaQCsw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795650254; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:fWvg6YJYuqm4idpHmbVe49cAOGftJdy0UrRWSaCV6EjtqGI
	FrXbySpN+jWC9yzTtEeRX2BH/AZAs3tZr/Om4saqZ6KGLsqz2C0xcx5c7hrMe5B7
	e5p4fVbr9YvQo8eh0H8zOeR92Wgo1TQvfa1be9uymI3Do7MoZo0NDtG5L1r28PUG
	rOYv7Wf+fpYRa7TsiaO1S9YP2Dy88dmG/G6PctcGTAVvcbFwD+d6Cgu2wkoVPZxR
	aAmJZ99KN2jseqVdDvRfcsiJcfOTAk7Ph144t2vCpatAm/iHVSTMrY2kMZCXaApp
	0Jpye3KyzXifDAxFSdAPekhs0RXFzz6UNdwoZ2g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:9BkdY+LRpa1a4CLEazedbhqHL3hB5JfhgZTVWsRmtdM=:YQE1qOrkCrAjZVOPTlIxAkPWaxIbX2klxeQ+RmLrnhg=;
X-ME-Sender: <xms:zXIHa-asTg-4TBpv9BSqJP4lBT17UjV3I0oVVM7OFqTcbMmXXC4JuQ>
    <xme:zXIHa2mJXjzGCfzR5dPyE2iB-bi8YormgxMrUz8pRSZPo8MqncYBUwWi2rJXKnOnv
    VH1ysbxytyKouXu0QdSNKJ63ApVH87cykmJ_4jYOBRXmjKn3oHyMKpE>
X-ME-Received: <xmr:zXIHa8Vf630M-JLKPOaNjNqSuXSqz8jWYysKetfv_TlGwryq0wlMH9e66WJGCm838y821x5qgtvssexpHNXrRLRK0zsz9vKViwY>
X-ME-Proxy-Cause: dmFkZTG1Ag0iR2dwkQsFua3Y2PlvL776Kj9hZumBUwCXUhpq84p5VwF85u2jZOoFTF2p/n
    DWK+77HBIugwVI03ZNUFeAB8S6chqasWckA+xy3Bk8bS/Q+3d3IoEICOeBMiafT8YVPToL
    3WQsCGhrzHU7rSOD1aSqKpUQBksP6ISXn9T1/V4dufCPqedqKRAe3OQ+pi7tWvPv9zGCAm
    G9pdRaLEVtgHAlcsuKUx31/BbAkqSKUDNAFw29ZgGTr6nVcLI8VkeQG+wb82JcmDORC9m7
    +6Ud31o8ZIzOIIxdHjMJ3jW23cz+P4lprNDSzCMyeOwOpcYuTR8lgw3wKK9Uf3hDb4wFim
    iOZOa7GOLiip7o2aHyuYe01NhjPrx6Ays4or4yvA/ZAN7Pi1ldBoy9H/7Llyo9upfccgan
    X6kHnvIIu35HWgq9hqAimtmlB5F26dlRrAhefMW4iORzgUV3TfJuN2txH0xD/cy3cVGcF8
    76pB8R8n0gyQpeuFt13QNHISPUya1V7NsoOMo1iUPnscR6qq4FV6uETrAdyX+y45c4obDp
    exBrHbNLJfKCHdZSA5Wq6JmefKh/R7RzK1fLlFo9uApZmrFx9MPspJu8J63mADX2oKbSat
    Rfa5YFLybqnreTOFRaCdPsp6YclNb5UoVRWi06fCt+S30u8hxajqpCftpUtQ
X-ME-Proxy: <xmx:zXIHawIE_dKE9j0p1gcstwAXW4lbNkxarpdQ0PBLne5ixRtLlZbPLg>
    <xmx:zXIHa0sUqHeUDe4oc20lBGKvbZbPD8gJEV_zA01--dpabhgjF5k94Q>
    <xmx:zXIHa92F0PQ91bBuOOBsMxcyvlvUvZtfYFq3pnGWI5AsMOiVUa4JlQ>
    <xmx:zXIHa0MeheVkpXxG9rIGv_MUxIt4mJWIRYBQLaEVHGs5MdxHyh5YTg>
    <xmx:znIHa3JPyLWJ0NprvdTT2xMwe_6RPSMhzuh9xBnWeW-ajWk2yyFgm3Aq>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 18:44:12 -0500 (EST)
Date: Thu, 26 Nov 2026 00:44:10 +0100
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: atcphy: Add M3 series
Message-ID: <20261125234410.GC372978@robin.jannau.net>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
 <20261125-t8122-phy-v3-1-196e20b3537e@chaosmail.tech>
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
Content-Disposition: inline
In-Reply-To: <20261125-t8122-phy-v3-1-196e20b3537e@chaosmail.tech>

On Wed, Nov 25, 2026 at 02:11:45PM +0100, Sasha Finkelstein wrote:
> M3 series SoCs have new phys that are different enough to need
> a new compatible
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/phy/apple,atcphy.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> index 0acac7e3ee67..4dfb3b68efcf 100644
> --- a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> @@ -54,7 +54,14 @@ properties:
>                - apple,t6020-atcphy
>                - apple,t8112-atcphy
>            - const: apple,t8103-atcphy
> -      - const: apple,t8103-atcphy
> +      - enum:
> +          - apple,t8103-atcphy
> +          - apple,t8122-atcphy
> +      - items:
> +          - enum:
> +              - apple,t6030-atcphy
> +              - apple,t6031-atcphy
> +          - const: apple,t8122-atcphy

I find this ordering confusing. I would list first both `items` lists
and then the `enum` with the single compatibles.

Janne

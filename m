Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087564;
	b=2rnIcEY/YqQbIYJahT+LGzMACJEsqZnnMUqTf0He/LNRIem0Hz0tud0cTFdhSBeIa7LA
	 /LgsR/8xIPGykpEIOqCaGwuH1wzJ+QyxPh5mhRuAE2WIcezgqWUZs1Yqm31IfDzgcWref
	 QcTSZ/CI0HVr7XEiTWlZ+AZAGT0HPZ3kaSH1S6dbEQmdGNRXaf4awxC3ibQGef/I/YsW3
	 DwSfoMc4n62CVarwBuZBtoEiTxBCd5N+0JQnFo9XnYDy07E/PVlA6Y7en3uTzcpVOSFza
	 8h+0Z7tUmJNuF+8Lfgol3vdKFnxJXdpEjM8oDoJlW8zgsDK+ruiM8+SoQuOFGg/gQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087564;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=WfFh9jMGZpN2Zx5ZJjyviQRI8RDYFWhI65HAjYk9vXw=;
	b=an4dbWfc3Yx1bK7IlwN7hHCv6IPyN4jAiyuPsbN5ysP2StbxvswNrs5lMkcN2mxLnsmR
	 J/mxXQoc/+w36H0Pmxk0iHEwXtkBK5L6ih5dt6QZfPj112ZvK6hqFW4QwMizUxLTpI+CK
	 bEX8sAOIvjSTfLL9Gx3GoBfEdpGt1vQO9ZWrn7cXmWr0OyPDNNpfHa3CUHHEzKQuHTVSF
	 SULwl8o36G2LKixUlMHUESaAF6UZy/1Im5oXL3iTHay+bigkxGULqp/1kZn/PRbTItL36
	 rbIR5F+vTkCOI5kBlbY+aXsCLm/9GcDEWbHeR6CZiXH8hE8RKwUaFvCOvznnc58XIjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uP4KQJVL;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uP4KQJVL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3617F4E41665;
	Thu, 19 Nov 2026 11:26:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06A3E60237;
	Thu, 19 Nov 2026 11:26:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 457F811BC1166;
	Thu, 19 Nov 2026 12:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795087556; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WfFh9jMGZpN2Zx5ZJjyviQRI8RDYFWhI65HAjYk9vXw=;
	b=uP4KQJVLqzcetO1Nt/Nag/D9GG5LyfYd8vOtrrXeecJXr60KF6SUtzR/p46WPm8Vs0Tnrh
	anOu9uQ0I8uR4vZKEc/sjoQme9YSqbDUQIjjDouQrGDQqKTQGPFPoPDvniW3YtOrEU7/hX
	vZACI033wbhJeTczucp/030kpVDyq7wJDdbsuvnK9Kq7/HY3K2oqd79CAMs8+MjjyFwBF9
	ab+J8VJQN3bvmbwZcU0SdbICRzxDViegRD+rZMppdYrCK0l8HcsnCOHilDszRiBaTmYGT8
	7lR8I9gfO+qWBlkaMDT1CVxX1vlzo2xr5xAooPnXGiWO00cCMypiPlWtpMP+iA==
Date: Thu, 19 Nov 2026 12:25:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kalle Niemi <kaleposti@gmail.com>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold
 <johan@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 driver-core@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v10 0/5] lan966x pci device: Add support for SFPs,
 simple-bus part
Message-ID: <20261119122544.72e793f0@bootlin.com>
In-Reply-To: <20261119110014.582363-1-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi all,

Please ignore the series, I've mentioned a wrong commit in Fixes tag available in
patch 5/5.

I fix that and send a new iteration soon.

Sorry about that :(

Best regards,
Hervé

On Thu, 19 Nov 2026 12:00:06 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> Previously, I sent a big picture series adding support for SFP ports
> available on the LAN966x PCI device [0].
> 
> In this series patches touch several parts and sub-system in the kernel.
> Reviews have be done and it makes sense to split the series and send
> parts separately.
> 
> This current series is the extraction of patches related to the
> simple-bus driver. It has to be seen as a continuation of the big
> picture series but related to this specific simple-bus part.
> 
> Patch 1 fixes an already existing issue reported by Sashiko.
> Patch 2 removes the no more useful remove() function.
> 
> Patch 3 depopulates devices populated at probe() when the driver is
> unbound.
> 
> Patch 4 prepares TI OMAP bus-only devices to be populated by the
> simple-pm-bus probe().
> 
> Patch 5 makes the simple-bus driver compatible with fw_devlink
> expectation consisting in creating its child devices at probe.
> 
> [0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/
> 
> Best regards,
> Hervé
> 
> Changes:
> 
> v9 -> v10
>   v9: https://lore.kernel.org/all/20261109140916.90625-1-herve.codina@bootlin.com/
> 
>   - Patches 1..3
>     No change
> 
>   - Patch 4 (new patch in v10)
>     Prepares TI OMAP bus-only devices to be populated by the
>     simple-pm-bus probe(). This fixes an issue reported by Sashiko
>     related auxdata lookup table dropped in simple_pm_bus_probe().
> 
>   - Patch 5 (patch 4 in v9)
>     Use of_platform_default_populate() instead of of_platform_populate()
>     for bus-only devices to fix the 'unpopulated grandchildren in
>     simple_pm_bus_populate()' issue reported by Sashiko.
>     Add Fixes tag.
> 

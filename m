Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009258;
	b=aLfupxNtDB/1pC+a1sVmcYF+DS230JqdirbpX2fSsTbTqRlk7XzsK1S9o5tLh8fhK43S
	 ZgYGyixrpbY8n9mzRLTE400ja3rn+V/Md7/ZrjngMYJtYdX5WhC2X+3SxBkNkDOM+iozR
	 dq5Wrpl/1pYOduQ8NCpWdDwqwKg8E7yAA+JUXVGypT6b+TZdCRGDgI5gKylNk5TuEEkxI
	 ogdvowe7SH7eoAm+4q1HDaqIoN1HOrGs99SM+5NJS8lB0jgI/x5sxHOicy8JXSt52XhFy
	 jdTQhV2uZcE6NkseqqVpQFWnFYECYXQOKOa/i/7yw4KBP3KH6uSzcBm6+ww6pjtlAkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009258;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9g7KvO8us85H6N24ga2RiONwD8RDdkdpwC8qeCr66L8=;
	b=XA7uq7hoihaJ8MSaIgG3z5sQSeBRk+rHfWQYTBlTnIQEcRkb21wxnNUh/SfIUTojEG5s
	 4TiFufE7PVzpNXDCu1c/eMl8bdxUYARb2hBu6rS6aUMWgXKy7IzBzB1L9ccOksqZLNNft
	 1pz1KC9JeIUYwCj4pB7Mp9vDd1KHllMgI9zzVLZjAqEGi3niDyUP8yDNBjgBeFgU8vLgP
	 P9RADlQPhOE5OzRrXdMaxYcKhVLytP9huhZmNxs5ATvgT72sWVkHxeuEAJ6fzlFZgdMBj
	 QNwpwb3yHIL9GW7v1MMZcAmr00XISSZbVYNPaVK3fCczwOymx5ikPZoHlrWfZ/yahnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=q95DT8hb;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5FE60A2605
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D5FE60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=q95DT8hb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=9g7KvO8us85H6N24ga2RiONwD8RDdkdpwC8qeCr66L8=; t=1795009257; x=2110369257; 
	b=q95DT8hbPOqZuqTPZLZ93v1LqswgVHGyaMVvmK5ABlN6OnJDPVN7u+peCgldMWeUpPJgC/4QLgB
	hCbqbjR3wUujcJrS/S6unzENotw+qyl0qeMWbtf/EVAF6W5y862cC6h61m5cdOckk0PL+mcy0GA6Z
	tAsyvs8yJathMxSbNLPOPGvtOkpnsEMNdUPaBVMxhHeLVMJXnVUl37zwKo6vIMSZWLQ6pci49icy5
	5AIpzL2+SruME6bZzbA/opBblZmOGBFZUcTZ7s9VdZ1PrWKDCbQREVp2UwxTPS0RXDImekkwmy3PR
	8gJH/ft9rEQd3Cn4DhQGr/q3W7pHijO476Bg==;
Received: from [179.105.94.163] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xTfu6-000000011Vj-1H4x;
	Wed, 18 Nov 2026 14:40:50 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com,
	Henry Zhang <henryzhang62@gmail.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: dsi: Register the PHY clock provider with devm
Date: Wed, 18 Nov 2026 10:39:10 -0300
Message-ID: <179500914537.2054070.4093937938217881883.b4-ty@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117234107.1298575-1-henryzhang62@gmail.com>
References: <20261117234107.1298575-1-henryzhang62@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Nov 2026 15:41:07 -0800, Henry Zhang wrote:
> vc4_dsi_init_phy_clocks() is called from the component bind. It
> allocates the clock data with devm_kzalloc() and registers the clocks
> with devm_clk_hw_register(), so both are released with the devres group
> that the component framework opens for the bind, when the bind fails
> later or the component is unbound. The OF clock provider that points at
> that data is added with of_clk_add_hw_provider() and never removed:
> after an unbind it stays registered with the freed data, and each new
> bind adds another provider for the same node. A later lookup of one of
> these clocks, such as <&dsi1 0>, would call of_clk_hw_onecell_get() on
> freed memory.
> 
> [...]

Applied with the AI-assistance note in the commit message removed, thanks!

[1/1] drm/vc4: dsi: Register the PHY clock provider with devm
      commit: db9a489077cbe9217b7bc2b47ebf0fabc5f1a56f

Best regards,
- Maíra

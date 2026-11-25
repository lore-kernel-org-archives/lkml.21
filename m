Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623088;
	b=sfTDhiwhj++GeIC1pEBextHR5Majv4XuLaQALxiuCkVPJO9GrjUGW9mSoWSPW0QSoor1
	 6g7scmq8V2lkHtpg4n+Al1licoKLzh+hxwEw1/7++yXKANdbXHH+8iAuSMtY489PQO9mm
	 xEnuYRqg/gK8oQ4wSXaC04AoyXuzdCV6PPrw8ZCSYP3krYpGUHfP3yxXehOcJE0TmaDCo
	 Y81lSrlD1soNR6QaYMi/kkxLgxFxJCIWGvG8ejeBNdW8QXPbgHLDfG4WPrloor5j5h+hp
	 D/fEFLjcQqg5cjcP9qXv5N1g+yxAW1NG5bDKEWSsbQwrmB8rpkCklqacZpKUjS/BQ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623088;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=shMr3VTsq3XeQkoO9Ln5izMtWpMU+7APEuFdjKZvMdY=;
	b=soKq+4xTTHNyyZENHwiht8Vqy/LSpzANsv4AHAgJ1AR5JOskb6xj7+T+LYItwd9OR+Jc
	 3mg95ZJzltWOdHkarWB0nTfD1Vs6AKbEgDNXdbMHObLEatI8hsJO72kGqCErAf9IdYqa5
	 Wy4yv7xiNZz4tVYRlMhDbnyEdT252NDQyBuj2awG49pDcdkdEPdqGsigiLjblfLLJappK
	 0DVKOqTeJKAgsaz7SRKXD9XeQyBh7TZ3FjX5srA9kuhszoqSsKqEnHzl9wuoV/RxkPDsp
	 jermLZuRFlnmUS+f7iJAR2NB7nzQj8HT7BB1xJQCUejjH7PU5fmkHyJIFdzNJiSRUFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KyKHSlK5;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E846606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E846606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KyKHSlK5
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 429FDC6221D;
	Wed, 25 Nov 2026 16:11:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 345CE60480;
	Wed, 25 Nov 2026 16:11:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47C3A11E6ABF3;
	Wed, 25 Nov 2026 17:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795623079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shMr3VTsq3XeQkoO9Ln5izMtWpMU+7APEuFdjKZvMdY=;
	b=KyKHSlK5Ey6/akMaHN+c+uAv7NDQWG/yMqCI9oHkdzOeFbzRpfp9AX0SGw1K3164JB9OmD
	SBOtdiMH+BGgUgF2ct0BEaPwEFVq/GAtFqSZs0LarGryqPr7NPXdYBiOv18ORWOyFNKDw/
	rfUe1p8BMVELflNxh4NBO6aqhw2OzQ/wmafCV6jLdu1BO8GxEpYkJUDmGtPPEZ1uwFGMHn
	iSAxv03Cb4YalrORtMHi0FOmZuAqIud4DNo5mZFLr+YVVHtkCT24lJ73yd0ymz+CCnaIjF
	cR10/N5EuLjCMv+Ee288k3V7r1nHhACNaNtZpjOt8gJyJQTfe3yNYM412T5HWw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112162127.1592210-1-colin.i.king@gmail.com>
References: <20261112162127.1592210-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/bridge: tc358767: make read-only array
 ext_div static const
Message-Id: <179562307394.731258.1793421800570057727.b4-ty@b4>
Date: Wed, 25 Nov 2026 17:11:13 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Thu, 12 Nov 2026 16:21:27 +0000, Colin Ian King wrote:
> Don't populate the read-only array ext_div on the stack
> at run time, instead make it static const

Applied, thanks!

[1/1] drm/bridge: tc358767: make read-only array ext_div static const
      commit: 632586bd82b0158a97c6eb6830375c1efda6e0f6

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



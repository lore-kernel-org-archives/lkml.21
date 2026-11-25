Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575815;
	b=zpW6MrG5MqJdVg1243jEOqh++7jdSun5gDGLKO5zaXh38itrRVPSLkbKABQB4u9+tVsZ
	 5josAeHohNuvsvL7I/Sc/LMSFPUbvqVsv05kEQXQ1EU431P7nwPWICDvWbKEFcv4jxfIy
	 WhiAhqC7DWLF55q4b1efKsCgrqO5xq/l0479JZCW0xwctCPXi1/0GM7vteILegF3mHErH
	 b0nN53XvgsOnjkUxoz6JTfjNvBlNvSR5FJxYnKwT9t50PfPmIyivRoJBWLnE7FN7z4DrY
	 V8Ea5BdtjCnoUcUFYBs1NkbOIaZq7phvsEEAKtZT9m1t7mIJpZuKpnXdbXLokF8E1GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XvCX2nUztLlSyLc3rr2QnMaB+ZFYgpn3Aqh+iE3xR/0=;
	b=XyRSqrnn4LV+LUFZyFUEff8XK2Uyv546CSlFh7sQ4J6dodcjOaQ+iYVn21gITLQzATwb
	 5MiHMEDq5zwg5Ih4/i12euosYy/0f6JXwKplevoyu9v10pmY43berfyC4lXGLbhjZGrId
	 yQyeodm09P3zVZM4A3wkK164kbBAQkZ3B9WlJ1JNFtojZqku6DmratODr/5jr+IiRi81I
	 0fumxTp+DkfP78qtYgGCA/45yb6txdad+Y6A/B1V+mhLr5YonIq5gnTQnZyABAUqvLp46
	 VvuLR7Ry2JoiVv7acb80sLOjKIOlA8Vus/uwGa72ngWj2RBV2gTTlYVkqKBxQhS0yWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K250yYr8;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB32606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB32606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K250yYr8
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so4639898eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575815; x=1796180615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvCX2nUztLlSyLc3rr2QnMaB+ZFYgpn3Aqh+iE3xR/0=;
        b=K250yYr8VhJKucuJrDdE4wC3EJVDYc1zcrQbeIN4v0mICSZKAv82YLJMJyMcVf4pQ+
         ozSVuKGtwSecHV771Mhe50NcBaQQZENBac2oR5vMM/LZxeGYuzaOSnog5Tj79lmeQsz7
         9qjf3SxFZ9RNtZH5lyYOaJlJyy8AK0vTbMS1dYO9Igdu7uxH7OJbnQM1mX/LUFG37Qko
         b4jKkyQstOQBNRE1Lq3edVuQdu14Ey3MwtPYoSSfT92lPQk49HjDkvTIORwVGGi+hble
         sq+yfQkFyB3n1lSMHHjh1GH280s+7aXlviiGCjXk+tzDK0LCC8jS1fYWayo+yXrbQibv
         6OGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575815; x=1796180615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvCX2nUztLlSyLc3rr2QnMaB+ZFYgpn3Aqh+iE3xR/0=;
        b=ZfJYAASSw/3P4tRlHlLrckdaAegcG0cGdoxq33KfUHP00aPLjG7w56EqVvxNZN+5vA
         0R5gZEvkhJa9j9IDjHaAx+/PFTOR2iPnshdBnX9jadYEB3WrZRWpivU1FILxq/5ZpTUi
         sZwbbbiJzEs9OKVeox2mDb90l4QcynS/X5WtwMQHsHIEK6uoPJjlr7T3Xj8dJoutiGjB
         Kg80r0t6mhB+2CGQXyNH7V3llYLY4xCzzrD7iO87GFdmqUIB8OUN6AugNAfEoQL6pvKx
         7P2y8HWvYwYsCw1PykXQn/gMY7ECSciQWG8p3X4gA8XzrJlXIketWjI0xs/JSa6klGw5
         V68A==
X-Forwarded-Encrypted: i=1; AL+hErHNcLMIZDEL1nCERCCf6K4IDuEez8OiVBuEL+BYN/R1JXRAxsOxUKZ4kJQX4Mnd36KNPt8grM8cj5O0910=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tk+xz2jniXzZmoj32DMchMVufkrcSKXlz9g1yDr8FLlCwksJj
	25/tuUywRhwgZz5EzQHd9QvEjeyxutl1MPz/rF3yp678Vk1Ovkigw6fKLRzwASeAuX9VOw==
X-Gm-Gg: AZFdTZdCZrvw4E6U0E14M66y+aOIvFIT4JgewAopis4+SljfIrwiRNI3oHFQGuPI+tj
	8dqFHJbr74I7CT9cYmFAeQxHITzSbjuroxqOKWn9Vx05VwdCB3Ue2movk5zyK851wTvkzMG3bO5
	Lx7LNj5PHtQyKR3cW9gEnw8dXjb9amrt/7RjpSvvRGnyujx0erpauyLiI9GgjQrAWZU1idMBI0U
	SOBfWm7eXnuckLqnKePz6YGn6nPAMI+yhT+e2ND7ILZA1DPD3HczUaZghAqZuRqIgsyLG2bG7+E
	aa58j5WYy7K1wr6Zn35twNIAXnzjZ53l+j/uopIvkX+HdGM9fjUu25ORoT9ET8+xlWlCKTEidmS
	+b1XyNGLh2bJD6NFXLgJSUjtGzYbMaxIcRZBg80A7huXau+esxLY6Mk6PLdHcxOgwcL5IfUmjQ8
	7vjldHHWWd6g3NeW6DpFJuIO6b4eq/Oxw7EmL50UbQtHgmCnnZ2iI/eNivIeQExYkiQVwX+Hk1S
	NYnh8JQvLPkCEiixGlVlzf9lQoJrKmfuJO3+xcUa6od6m+asO5ZZJMNh2uM9YJfP5JhjVc54pVZ
	lMLfJXU3d/4tijEp6O1fF/uoQkQHKO9VdfSYRvrdbEXlS84NXT36Lp3hSgQKQV9Y3VUsRfRcw+J
	9lxzJ1iqlTArMdOIqIePUIfIy5AnZhRfQajRGzaske/w0pf4qDW/oLlTlPwTep9sdtGjy
X-Received: by 2002:a05:7301:150b:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-3856ef47c9dmr16503589eec.19.1795575814384;
        Tue, 24 Nov 2026 19:03:34 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm52243475eec.14.2026.11.24.19.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:33 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] thermal: rcar_gen3: fix the interrupt handler lifetimes
Date: Wed, 25 Nov 2026 11:03:24 +0800
Message-Id: <20261125030327.953450-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124095110.131258-1-shunsheng1218@gmail.com>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the order in which rcar_gen3_thermal_probe() and
->remove() create and release the interrupt handlers and the thermal
zones.

Patch 1 moves an existing check; it stands alone.

Patch 2 releases the handlers from ->remove(), before the runtime PM
reference is dropped and before devres unregisters the zones, and
undoes a partial interrupt request instead of leaving the first handler
behind.

Patch 3 requests the interrupts with IRQF_NO_AUTOEN, initialises every
sensor before the request, and enables the interrupts and their sources
only once all the thermal zones are registered.

The driver keeps its ->remove() callback and the existing polling
fallback when an interrupt cannot be requested.

Changes in v4:
 - Split into three patches.
 - Keep ->remove() and release the handlers explicitly instead of
   handing the teardown to devres.
 - Request the interrupts with IRQF_NO_AUTOEN and enable them after the
   zones are registered.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.  No R-Car board was
available, so probe, the polling fallback, resume and teardown were not
exercised on hardware.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Yaohan Li (3):
  thermal: rcar_gen3: check for sensors before reading the fuses
  thermal: rcar_gen3: release the interrupt handlers from ->remove()
  thermal: rcar_gen3: do not enable the interrupts before the zones
    exist

 drivers/thermal/renesas/rcar_gen3_thermal.c | 96 +++++++++++++++------
 1 file changed, 72 insertions(+), 24 deletions(-)

-- 
2.34.1


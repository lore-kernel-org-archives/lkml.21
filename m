Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106549;
	b=eZBPY0IHB31F8JzcgyVOMrd6FiNlwzkev4uUXEYHeC3OcIVnO3pIHcDizUkqwEoqT+eW
	 1IEaUR/qcCod9xUEtYUJS4u92TOKNcZAov3DRjOddHS/3Mr0LOAlUtbXBM6MjcwqSKjvb
	 weFRXje31Q9oKc82IQ3G77J7lnmqzx0/jjXqPNZUzZJZil1Mx3cH81euHSlMgS25HWl2U
	 8pbZanA3TPDoem0TNNbVwV2vbFR+mXeQOoBoSYoWMMTB4TbKqzsUOv0VaEfO3TBsGYj9R
	 OSqL9rGTX4hyOWh+VlhdjS1w/oy3ag7CUHZISpsmOKFltxcy6JGkSfqkvnoiek+8AWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=KUBWs7gHzAoDsOIKeMKkrUFWN0tyJdvUWhYfBTyuJvo=;
	b=1ae9Bgg0nuWZTfpQArdLyx6TrDLc162VCGgT0TiIHhIvo1/L67gPQv1wuTymIqyX0IT4
	 /1qOUYC2Xx21mhgMlxZLpYzRftuVHTtUGjH6srGQcshgtBKQPJPszBZbdDhrvwLR+qfwP
	 Ih125mj72wTCUIgMgOvvLeMIQ92EB3ONfD8/pRC1mEtYjV8Psg+jA8ACsetFqpA1F51Zb
	 +0wDoPqdSGtYHWNKo58/LsnZVoT2M9SAiqltbHu0fddJnEY9DCXB/lBWB22DRhEvACkqM
	 Dc/Gu6ki8g6G9dsApphPru9gkMZxerul3d+vnUb/bU/4zpGY5L3pOO9WZVfDQiYiKkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/2oD4GF";
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFE2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/2oD4GF
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ae5389c00so1719122eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106548; x=1795711348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KUBWs7gHzAoDsOIKeMKkrUFWN0tyJdvUWhYfBTyuJvo=;
        b=K/2oD4GFLgOk9e6Xfv1HRDr7UpBtK7L/97jPDOsWzT4OVqT4+sydbbp+rxbkDAYbhb
         VFNd4/h1zoTQz4tZeyqApM9i0h5t0HIhdkXElKKJtB+H89mkp9yUYKbL0Z3zWplIQCYR
         sIdDYlUE4HZcZ9KeczMirpYX5cPS0Z6+ysbrEu7eV8lHOrK3TNT7lF40UEDUUEvKiU0I
         V+OeTV7ddMWZf2lGP9MIhokX9bFOczymeOFIR2ntsv42PwzZ8EWLXPWKeE3s1R/21IYw
         CoHKHobFPhH6lpWXWg3C2MonIZffowKtXc+j51Eh8FrSlTEX7Abh9/02GIT+08iet48x
         6ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106548; x=1795711348;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KUBWs7gHzAoDsOIKeMKkrUFWN0tyJdvUWhYfBTyuJvo=;
        b=bLCPz5HtUwH7N5H5q4AyXy07HgE9GpAWexw9f8GQfi7TUPPFcuUHGcfTNHEnbJgClu
         BUDmvABI7WX1ob2Ou6djk4RixTr+X6VsIfMqujgTwDnJ6FaUIASUFOw5SmDsgrwulrLt
         nSJYCCI43IgS07C0V7a3pgPj8/QwMG/wXVlxhNCDop3mChYdViBOiou0ta/t/ZS80Qtv
         DBU7QeCTANV11hzp7Fy++2MbJqS0JoXB9lV73diFZMJBZk/6AIC+g/fBJaX6LZXuwcIT
         sJP9wUl98pCdaql+27ebPyF9ARVeo+TQONyqizXx/iRCkaaf7rAR7YHoxq2Fa1WARm8S
         scoQ==
X-Forwarded-Encrypted: i=1; AL+hErETUdGl6uMAaHTjxZ9qeQc5d7k+b356TU+AABtI/Q13ugqv9qlKY/RSpDxD3zqcAhFQ5g4+i+FoWqqagyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M/dJ0pUTr02nrZfystq1kOkfneHpuzPNcpmHifGVqJJYVnj3W
	fdv7lx4ujseEigrwusWAE7mlLqY/cHTWJDjobhqy1rC6eEb0+L2yNYDF
X-Gm-Gg: AYBFou2WrjkB9KbQOM9iCUOjYTqfxN3iGGY7LJPTPOwZWJZuwKM3QmShKeWkuu7wcbw
	pNdJRUHbCs62ug/2DB5+3kYrdNfMZ0jZxfQHPgkgM9vVcOGTIaHeRYwfXjqytB7D9Ocz6mpGE4Q
	uAcF8BbBWWVYvrAL/sMBlY+LiJsL/6CvPCE1DaHj1iU0WU1q+cNz82A78zaloYkKrwRD4brfYxW
	n5pf7Fw/2rVT8tVOYeQ/UMkVxqgqo9Pw7tb1mhjD9Va0stphdXsIsu/XCZqNImqKWN80IUIuzYb
	el7rbzA2RwKDI81J40Iw+vxWDsOfVToTrPNwA7PPW6YwxxABt8o1+ATXKWOolH3whKlrEJ+eJnC
	RVI7wjHAEr9s6a266+ot4jpSc5oUWMS9ha7bvdw8V8AYXrbPuZRZZShHGHhFOAyQQPa4MKrLRHc
	ZlyygZYw0tuzM2QRztjVP9UW12QUp8aMfijwQHlhRPphFhNWxK4leGBj59xjktkjPY7KtpJQsbq
	5EplJ8IDQwJ2Gp7RzD2xtTBwzD4RBH7go0XjE+SM2I4WaZUZ08/8xpX29lFyVM29T/OsdAwjYRZ
	nwAdbrOIs7zDeHY3iSRSKUId/kbp+ACFnwuZj5p0U6eUcsm8RHEU9CLk0zpmAeCW2sZCL6yN11H
	uLV8G8dyrMmdh3ETKsw1IWkiUFsAB80zcI0dsXWTXgk7FvC15wOXgGjwQTzNYCfaEXoZ2iLoffk
	twtkooHLzyd4+gVe9nO5SiDJoErSr6PnmZCQcj/6OvTEhGTUBr7U8=
X-Received: by 2002:a05:6820:8916:b0:716:dafc:55c4 with SMTP id 006d021491bc7-71b39510140mr88553eaf.56.1795106548440;
        Thu, 19 Nov 2026 08:42:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 00/11] nvmem: complete provider and layout disconnection
Date: Thu, 19 Nov 2026 09:41:58 -0700
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WPTW6DMBBGr4K8rnHs9Cdh1XtEWWAzhmmxTcfGI
 oq4ew30ApVm8zSfvjfzZBEIIbKmejKCjBGDL6BeKmaG1vfAsSvM1Em9Syk/eJy1w8R9duD4RCF
 jB8RHtJDQAc+SW630uZNXZU3LSs9EYHHZHbf7waXkC0zaiv8SBD9zkacjxnQbgScCaKohpSk2Q
 vSY6m8gD2MdqBfTrEU0Tozo50Uciy0jIqFHsd9XF65sIO5hSWxzDxhToMf+bpa76h+flTnxs7G
 6e71cpNJvn71rcaxNcOy+rusvljIqdE4BAAA=
X-Change-ID: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

NVMEM unregister already disconnects register callbacks with SRCU. Some
accesses extend beyond those callbacks: keepout traversal, cell
post-processing, DT fixups and device matching can still use provider
state. Layout unbind also leaves its cells and their callbacks available
to retained consumers.

Extend the existing drain to those accesses, and retire layout-owned
cells independently of provider cells. Old handles retain core-owned
metadata and reject further access. Explicit cell references and sysfs
group ownership make layout removal and rebind independent of existing
consumers. Release the write-protect GPIO when callbacks are drained so
a retained consumer does not prevent provider reprobe.

The final patch lets providers distinguish an explicit NULL module owner
from the parent-driver fallback, for callbacks implemented by built-in
subsystem code.

This separates the NVMEM work previously included in the raw NAND
retained-handle series [0], following Paul's request for smaller patches
[1]. It builds on the NVMEM for-next tree at 6628e7d4c6b, including the
existing SRCU protection and device-reference ownership.

[0] https://lore.kernel.org/r/20261115-submit-rawnand-retained-handle-lifetime-v1-v5-1-cbc49c5c5e74@gmail.com/
[1] https://lore.kernel.org/r/9c247830067d2192acfe08080d1c5f2bb366cf1a.camel@crapouillou.net/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Use one SRCU read-side section per register or cell access, including
  keepout traversal, partial-byte writes and cell post-processing.
- Use device_set_of_node_from_dev() when inheriting the provider's OF
  node, following Bartosz's review.
- Use an SRCU notifier chain so listeners can register another provider
  while a cell notification is in progress.
- Check cell publication against disconnection under the list lock and
  drain cell-add notifications before reporting provider removal.
- Simplify error unwinding in sysfs cell creation and layout registration.
- Link to v1: https://patch.msgid.link/20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com

---
James Hilliard (11):
      nvmem: retain the provider node until device release
      nvmem: drain keepout and cell post-processing accesses
      nvmem: exclude disconnected providers from callback admission
      nvmem: release write protection when the provider disconnects
      nvmem: reference cell entries independently of their provider list
      nvmem: manage cell attributes independently of device resources
      nvmem: distinguish layout cells from provider cells
      nvmem: disconnect cells before removing their layout
      nvmem: disconnect published devices before registration rollback
      nvmem: u-boot-env: propagate cell registration errors
      nvmem: allow providers to specify an explicit NULL owner

 drivers/nvmem/core.c                 | 545 ++++++++++++++++++++++-------------
 drivers/nvmem/internals.h            |   4 +
 drivers/nvmem/layouts.c              |   2 +
 drivers/nvmem/layouts/fixed-layout.c |   2 +-
 drivers/nvmem/layouts/onie-tlv.c     |  19 +-
 drivers/nvmem/layouts/sl28vpd.c      |   2 +-
 drivers/nvmem/layouts/u-boot-env.c   |  25 +-
 include/linux/nvmem-provider.h       |  16 +-
 8 files changed, 401 insertions(+), 214 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
change-id: 20261117-submit-nvmem-provider-lifetime-v1-fb2b3d192fca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


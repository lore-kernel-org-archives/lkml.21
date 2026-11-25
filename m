Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643888;
	b=YWdVp4cuZhmZkmYNjXsQXvSSixwFM2HfWKUJkiJdcfGylPDxeIY4VyLiuq+JuO10fFoX
	 XPY8ZLewE1W4PxVkKg2VqHa5bvlavVmOSD5RtCxjHdJpT6My9KYeqiO544wXiSkbyNAKf
	 GOSOVepIjBUJBgo6FxaM7W2QgVad4T/IgRqBc+AxM7l+bPGwYBcA7qrjnXpZUz6N999Fu
	 2kBDqjvdmjuF+h6ZKKGpTi20Ob7NzE77p2RM+pMP/mdE5y/sK8wzmW+I+m0Fo49+Y/PrZ
	 QJWfSS8u9vMr4iOTRdyVpK7endbuSB2H+qLjp4r4IUcj674rNQaCKiFnalpBL8tmqag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IyvqgKo2v6BVnDcrFL6Wvc36wm6DoPtZFNiMkXU3xrc=;
	b=UPq0m32/eS5Kdpbu0H6gz6cyIaUvBmKrY3eoWHiFSN8O1CF46zhjGISlBSY/hPQmLTUw
	 h027Ukpzc/vLofM5i2sr3UqrDjIAPAT3X3wnTfzB5Czjkol0tATApDmfc6ycXdUC/b9ka
	 G2mh5rvtlzxwkugGl9QPot7MUxVH/gcQLiWyDZiLfygu9ni8AavQ6twCn22Dconj1+m1/
	 Fx3Gf1znrRCEL70os5M7++D3j5CXVUo7PF/9D99D+1fma12WDJB0cExDulY6cUehPd1XV
	 /dMhLb2DqV18oXxQ6FmH9Sm46lM/nqmBoG0M444HQH5X71WAbhdjv5q3mnPWbdvh1Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/Ybxl8q";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB08C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/Ybxl8q
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso43791825ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643887; x=1796248687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IyvqgKo2v6BVnDcrFL6Wvc36wm6DoPtZFNiMkXU3xrc=;
        b=r/Ybxl8q3Wc0ygxh7eeEgZmgmz3k9BuYIGmmAFyMinBlLuTVxGadBtzd9nsrULGjwm
         0VFCOKNNyu5H0nKL0ACWvrdzrycSn6oudMciLnIRNGsKty/tdpXsRM60Z+ty33ZXJyDX
         sEUzMS27QkI0kFsgZgo3Ppqd6JU+eaZ3g5rhFeYoXk+C4uaEFF078HAjY87lPAVhKV8Q
         +Jayyp1myy6TVJV42ZYbuw6PXuXmpGgevNxgssW8dHJe+dkQO4sokT321R9Grnzy15/h
         rpEQ6fZoJJdNr1SMjqCroZi+sQpJCTT5PHJnEhZkp8HhjgnIjlbg7bJmuUbcjWqMhwzx
         bMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643887; x=1796248687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyvqgKo2v6BVnDcrFL6Wvc36wm6DoPtZFNiMkXU3xrc=;
        b=bSmI1xF5jRdpu67MCynwWsC19A5+DbPt9H6jBhmI3+eQaLuERwviCdQyQZ4DnkzrbF
         1suc4yfYYZqudMIG2kgMNQU+UD2JnuaRqY9Ws7J96C5YZ++MfWNY53mB9gefcGfrrukq
         jMlFsQ+L7PeUXvvYV/x/km08HMWBWjiTSR8DNZZ9NK4ZNVXanNlyTV+Akw7EWm5S4s4o
         LcAUzCQ7p/vjrEAdC2q57bdgBiRegSXvKJHi2x9pqXsnCL3wB+O7HYnorxnXXLot+Qez
         WkO3+sXkGd1rBCJAmGSJbGFtjOFzIblHdhmLp2yIJeLRSwH9Hl+g3bDtAIDR056np+e/
         MRbQ==
X-Forwarded-Encrypted: i=1; AL+hErFQp8FftHOQtvl6VzasMsSt6YR9h/T5LRyPDeouEF6HrSxnYAc22X5ZzdscVh/Hwdbjde2PhiIZml1FXko=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vxByzwpz/JdDxMLZCIha10SpjhomU/RuCMKZ1veefE4+8s5rn
	0rZoQv0NbKXo2FLMJjGMOQ3M6hIAE7aGw0GfamnWYyUhwseSm87tFM5iUZcsEjfknSSL/Q==
X-Gm-Gg: AZFdTZfdctL9kLwmLjewModM19bMfm+O+J/GXtrx8Q567u5dAU1pYy0CkWuR0XUobAi
	OoljkWSPRaLe0vblTV8HZf9MLoXWPeh9OVOZz539YKF+rpFwcUPLE3dwPbBxbmPImEXYlLy4bk9
	iVj1hbeN8oj2mNfqQ7xK8IjjdHJXSeJCeH7tbYnnFJXihi4FeLD5AeqrpzSIL7mFI36wZbkFcKR
	hUJyLqKb69PtTiIMcy+WyTLp8CAQAliEnb45vsMD9Xe65e7uVpCH7QQ9EV0gt/oi2GS41kcIYi0
	MguE5WQEhftJNatC5FrKe0oECKh/kgspnh8og3/8qrJIw6BiPhFks8jHFHpG2Q6U/SYzGTz66Kf
	DM4AkqutdP2gAzl2+zq86b61r4oja/1f4hU8HgvlPupyYa8HfJ8LlZRNwEBK/5yPWcp3Q41JrK5
	+woTeqV3KE7hBHA1gPq6yjnjdc4KqjSL4gId7KzqZITqFHZQWhEqMUejFJ23QKgS16sTOnaJR9+
	xTCsC9Mb5thJ0XZ/afqzJYey7vMxEOjVg4Uxh/x/uGUiI3oF9fPqfgjaHY9aBy8MzWbqr+Qyzbp
	F92lbxLlxtn3lo1O5shhCeQ+1U87mAOTEzwn93nvgM4WGCa4mpk1vA172wMP2nkfXEv0QJASkIA
	ZHxipZv28t4bJHa1hnX+nmw5NGtF4K0g4xNbaU9JVaqg=
X-Received: by 2002:a17:902:c406:b0:2f0:5a4a:2d9d with SMTP id d9443c01a7336-2f05a4a3812mr122752875ad.19.1795643886954;
        Wed, 25 Nov 2026 13:58:06 -0800 (PST)
Received: from localhost.localdomain (74.82.221.43.16clouds.com. [74.82.221.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm91547365ad.3.2026.11.25.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:58:06 -0800 (PST)
From: Nikita Ivannikov <www.nextry@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <chipang_kao@asus.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Ivannikov <www.nextry@gmail.com>
Subject: [PATCH 0/2] platform/asus: asus-armoury: GA403GM power limits and a MAINTAINERS fix
Date: Thu, 26 Nov 2026 00:54:29 +0300
Message-ID: <20261125215431.120307-1-www.nextry@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series adds power limits for the ASUS ROG Zephyrus G14 (2026)
GA403GM and fixes a MAINTAINERS gap left by the move of the ASUS
drivers to drivers/platform/asus/, which I noticed while preparing
patch 1: get_maintainer.pl returned only linux-kernel@vger.kernel.org
for a change to asus-armoury.h.

The two patches are independent. Patch 1 was tested on my GA403GM as
described in its changelog.

I used an AI coding assistant (Claude Code) to find both issues, draft
the changes and changelogs, and run the test; I reviewed everything
before sending.

Nikita Ivannikov (2):
  platform/asus: asus-armoury: add power limits quirk for GA403GM
  MAINTAINERS: cover all files in drivers/platform/asus/

 MAINTAINERS                          |  2 ++
 drivers/platform/asus/asus-armoury.h | 32 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)


base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748022;
	b=QrUpSNg3xAf3Ltb/EfX1TiRwzWipeqmDAGicfNcCVQrhyxwvoH2Ap1IPdH0wUIPDoNYO
	 5Lqe03GfRXdZwwR6Kx1b3MGcR/SlXzkaS4afOHxTmHeUO7vRQSMvl1YUH3aeVdfRP6p/I
	 A1hbaPKa3AIbaKAy+L8GswscczMvZdzdhLfzjB4RF1lxXi2Cx0i+KZJpT2D3e36TmRk7N
	 9uhePd5AEGw/SopdRHFTYzEJS2UYLzjaDYoab3H1eAk1cKF0ox7eZzBe4ZtVF//p+4+ob
	 ZpaOU4BaIKSrilQIATktOTpyBg/BOTuahVVplWZ4JMtZ/Ow4Re/FngSIWrcCsmOIhQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=51qG27bZ1ggAX5pcc8kXdn94EdxvlcxhzAlR0LoGtcs=;
	b=LCAA9X5qJnIPwVUm9+0ksNS7feiBjg8hZiCG9hXlUy/PCw9jB457NZ8HH88cWIkoZ3zV
	 /wKYF3WkhxytqsuL0E02pFj37YYE34c6ego74kS6C8eMwHgro9GZjv5+CwfN2p/82WsGV
	 ecwXJIQ6J9D6TKG0vKINuNilaapnRHFBa4A/YAKUVCMrMm3CFLZJZcoF220nJElqV4FIY
	 J/KZF6Fh9QhewT6G1lfluagdbuaPjXE7o5HTcpYX7nng0izWxv3+8CbP6PCC7r7xigB9I
	 uTV6ILSTTqOy0Lydnxjtqj6EatXz0ENnBCtyXwDzRDu5XNJdBTp+JdpWYROxbrXn3KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsQNNbDG;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C84F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsQNNbDG
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so3834820eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748021; x=1796352821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=51qG27bZ1ggAX5pcc8kXdn94EdxvlcxhzAlR0LoGtcs=;
        b=YsQNNbDGSDx/fyuRf4JncIK203zn+vKVHPF9D0Hpj6OnoqPsidG+O3jxh33HTuQaWv
         mI7Ut3fLSVJ5U7Bb0Hr8237kckAFy+Q+pRcessuqLnw96I7/1ESY64tEPFTp9GgD3k18
         s92wuvgCVJB/GTXM3fzLktjIblFPaURlLog2tSpocwqZqx8N8VbytgCwCuUK5P/kbxWB
         5XdcxXQfx6eFPz5aRMuB7x/51kUJ+p3E9i+rhBs7Ep+TFukTcv4vLjh92Tia+eWEBDpB
         v9ySo7czkJphhziLVet8gRlJNt4GDWxlqSe71lDrT5TpLs2sPv8AIKvCHapYt9fc9VYQ
         FLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748021; x=1796352821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51qG27bZ1ggAX5pcc8kXdn94EdxvlcxhzAlR0LoGtcs=;
        b=ORjJAzCIYF3OOmo/+/QY00zGqfasS1F8ZqzAWSrTO/ftzqUi/T8gA5dkj6h/YxoGkK
         63+g/LTCLlUcz4aIS00eBDu/8UkjD6yuB9EXqAYfgtRdK6v0+Z/RMji4AMuZjJmcLoAJ
         jgbjsdfT8UmzK+Yq3AJ8I4mkz7suns7cx9ybBjqUDXqhWeCVtW4E7XuimHQsVMt0D4+g
         JrB2Q7PJU1Fptbz0o18Fk5emKnZ/alYKtE3F1WQZqX0iYiQHbd9c5pSR/aa5skvK75oB
         QLfR5JtgCEITg5HMN1uQqcEpZq3wbJ5R1KBQ3NJRVclTp5omQpXjSG/ojaXo4Rgk/wIW
         ZiSQ==
X-Forwarded-Encrypted: i=1; AL+hErEdJMhaQrbZirF/vhmCu0XEE8yI9BOjiaYJ/+RD7E2usMtDLXrduV6ClvUo79yE2ZepnQpuOfnCT7BptWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lLdY7hq+OXyHBVWemwDefHmQX4EHklALG1CQXepKtC0TjCZdK
	bqFNMhLrOrI4PAL13mVOazMDSYFQiDimrEHotXkBoy1dqTa7r1izQour
X-Gm-Gg: AZFdTZeqxvije7bmuveBj50GMLMLlMR5cTbemwn9t0kmS2rnAzvtrcY8YHiybszabR8
	qUKGg3N49ltOj2OA72qIHDWW/adbq+DwVaAnIEVDn0itqEIg9AlOsKTlhlfGta0vzSnJq+YYdFw
	Uc1fvE1yiVO3NPSKqZq/XCltGHXkwRe2yWUteOY3/Lw34VLRmMkKgBRV9sX7rA2xCHWEEIQgyML
	EA0T1MWKHY2D0uuox4eJLm7yr10aV0V3zRL4S7ChmzrD+mV4eo0nX7MljuewIE25SE8zwKFv6O2
	qkauI+F8/CebgRyCK4FMCgDUrajqrLc7gkNZ7eOuW9gQ3jylmyTh7aSn/BY7x4DwZQKYhtGVIB0
	Sz3yPwp3sKxnyo7+w6PxGkVU65BrXyuYN5w1k7xiiUDoccF0Dl6telrh6CpOPU9trjaZAEoRqyk
	Edp/gO+KbNiP2Gv/443GueXasGGtSJXagyAG+bttL8QDwxg3N7hyzQ2wyJYu8kfV4X1L9jItuUl
	2ycM8tajk6HI6GcGXtfJ/D2mgqoZY2c5ug6u3ATbLsS6ZR8f/lNqT4oEV5/l2FM4oNarh0IehnF
	4f9NsYNtOLM2r96iD2udgPrnlaCTpCNVxdpLjzcHjZff7b5UTezVJwl2zXstQqoCqZrEojjAyE2
	bCg/y/wwjxtOumxRGkeMX18Wpsr+0Ug45FWrdW/j9qt26fJry8inUaP/8/fFvrs6RdMMljCWiiy
	Csgg==
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr23705671eec.12.1795748021053;
        Thu, 26 Nov 2026 18:53:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Thu, 26 Nov 2026 18:53:35 -0800
Message-ID: <cover.1795747885.git.rosenp@gmail.com>
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

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed with kstrtouint() into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
   (v1 of patch 1; v2 is compile-tested only)
 - charge_control_end_threshold rejects -1 and 101, accepts 85
   (v1 and v2 of patch 3; v3 is compile-tested only)
The kbd_get_state() failure path of patch 2 was not triggered.

Changes in v4:
 - patches 1, 2: Fixes: now points at 6cff8d60aa0a; 02b2aaaa57ab was
   reverted by b78695a71de9 and the feature re-added in 6cff8d60aa0a
   (review feedback)
v3: https://lore.kernel.org/r/cover.1795648586.git.rosenp@gmail.com

Changes in v3:
 - patch 3: make end unsigned int and drop the dead "< 0" check
   instead of switching to kstrtoint(); retitled (review feedback)
v2: https://lore.kernel.org/r/cover.1795219225.git.rosenp@gmail.com

Changes in v2:
 - patch 1: convert to a u64 seconds value instead of failing
   check_mul_overflow() on the int, so the unit selection below works
   on the full value; retitled (review feedback)
 - patch 2: don't fail kbd_init_info() when kbd_get_state() fails;
   fall back to level 0 / off mode so the existing code picks sane
   defaults (review feedback)
v1: https://lore.kernel.org/r/cover.1794633179.git.rosenp@gmail.com

Rosen Penev (3):
  platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Make the charge end threshold unsigned

 drivers/platform/x86/dell/dell-laptop.c | 50 +++++++++++++++----------
 1 file changed, 31 insertions(+), 19 deletions(-)

-- 
2.56.1


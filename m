Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032308;
	b=E+ZPyuapt0Hbt4+MLxKw34n1ERqzConyHkapm24/uOWKnN6t51umtSTc/SO3Chx1tDFW
	 ogZQe6wNUFcy3abH186DCXYhx0K4qbLIBXexkcE2dyI3GQzSAKAaMUu4BpD8ii7CUNPaH
	 hrCIc6TUpxaUJ39L1AImgEwVHJ83U2Hgj1NoOFTmccGhqo42s3EODDUqVFYlayXAtlzZV
	 0dLx8XGTOS85RNe1QXlz2CAi65BnmtZT+ha+IQiuHPFCly8PhCcXbocl970txDcRHgWKY
	 ipNxsN5mOxS5JI/4FBaMgFobicLz9Y49E7aq6bvUTxx5Pl6Bu5JvPTMVpAgm5Kn2KEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z+2tht9hWpEGbEFYrk0DIzYT54hNPtpFJmXd2hLjDks=;
	b=tRDNiuzKvKHIeikRy3AMdwMV/C2+8QDpyU4ULhotWbug/AEW6W5HEj1P/dyl5LlR8s6z
	 DMxgSc/ByCZbJbSU22vBMukVCWRKRzVMKgfrH8E43XiXP3lAxbk8AcS9PIBZnb7ek6vop
	 VSZMWkPm5iAXykBt33QJAFSdaFvhfzx/5LHbBEOjTFRM722E/7s9DPuylDqqMH76+cDQr
	 haYQpUGlXarYzVGsZdo46VI8P4t5hlvZcIq9MDjD6jajo3ShkgwduplvfM2qg7p/A8UPs
	 PyDqa1olk6z5pSaxRX6qTu6DBZg7x8iSufnX5/C9fMBGd8lyA1Zgl9W7lfQLSFNMFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQvqDo0a;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA90606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA90606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQvqDo0a
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so3839637eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032307; x=1795637107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+2tht9hWpEGbEFYrk0DIzYT54hNPtpFJmXd2hLjDks=;
        b=cQvqDo0adnK7+j+Y1uo8XzQfmY8Bo1NulbOXDjMiiFgpH44YZ3VzH9cEKtEfO8Jj3H
         vJShE8R/Sl9AQPchvwmBfYUD9jrGg6rc7zAKv1rfdV3kjCBwwIMqE6zFJtYgQZuPkV1g
         RlqAjRa98sR9bpQYvtwx41D2DOkr4AaVY8ok5QEM9UnD1K2rPiQNyrdB6qPxh97wARzn
         9q5BfbmE1BlfuwtLAMaDRLXwipLCK5W+8fLykjOZLPQudmUW3g0V50k/1A/3teiZsmiL
         fIpzX//eDzY8WEZf99bw+VeyzopJx9OOqD9fBNkwSc9tYOkrfBF6m2SJvd4i9HSVoEXn
         xWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032307; x=1795637107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+2tht9hWpEGbEFYrk0DIzYT54hNPtpFJmXd2hLjDks=;
        b=xQW5AmtYN49l16rNKS6xDhsUM6ZLtcrJY45qZ0plzf0bqqt4RWwrcKsnmdvMwz3S+7
         ayNLJ8fiZCtTTV1fBNlVr2Pm+xlE+f8LCu8KnirIeFGdowy5JWa+IwbVsiGx461KJevv
         5GzpWQDBKOsiB2IU1Ro030726Su1qhpG/wZWMHXv8mewHiDlK/d84VLOGq0D/U5APtyz
         F1ACmutQalNUG5J+76xPoRBw3WFUeTinUQfIYLogD6iOtJ13qQMXSS86mNj9UDt9tm1O
         OdcxSDSLt1KxY23YIefBpuZfmmiyWCbvYGlBIiZo3mG7AJxQuJjA+XCyrMbxDq0VsS51
         YaHw==
X-Forwarded-Encrypted: i=1; AL+hErFfVlzBtxXW5JMhbryYp9MAY73zxPvPuH4BB9vNZSLWV/eXI+4N/ll0uJOBTQQwDY/vDbmiMP5ZGFEaEII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TZQhMn23/NPI1gEljG2Y6w6oghAJYaGu8/gJ5nUlYnuFDFxFl
	Gr3Xq+I0HoSu37+TpnCMXYyWn5BaRS09DiY3UeTmvo6hwIm/n3nvBGDwWlzkbv3x
X-Gm-Gg: AZFdTZfaAXVWiNdSrV+vpszeJtK7nCkLwEj+iudBoUcU08wihl4gCDvWj36KGUbSeTe
	Jc1FeCI3r9bOnBSCdF8cj6Awz0jeZ2k9a+QHSgDyXCQB/AtDi7rgz8Uhr3BBZfoagVON0VoCE/b
	ueTzEKFdVfEBzWloApj2weMN46F3P+koRlmkI144K5wkygvAvfI3YTCv7tVvh9aEyygJ30w8dAX
	2zQk0tQy7wQ4IA/ra4R40dYcvwbWG5suOkPp1/Z86D/hYf2l3ZjLLmJTUbBu6n6FB1CowfPFcxP
	eMcltUkUDo27HnkFuCXW4J9aURxvNQ8+HsZMTWKuILJlejn/6P+NeOdtLdlb3JTi7Qywvjo1Yem
	JMkKhKloC5YyJMINk3tcWP0r/tW94O1Qwf1qt6oTvvGvcs6YGUnVZGs+Ib63EZXVILMEKsBPjgn
	GKz6frglQI6/wE73LcTUHMpXHDPgJ2xKzKk73Mok7dkxR7FwHkoRLHzoKU1iTG+/mivp6fIXm2D
	pbt/2QtJxM/nEIlWmWbcRKSguZtZaTvLRlc/YlLNTG48eGdG4fCXwk2EjdRFkqG7TYp9HgvFjmD
	jMGf5ZVLqtw8cFaUSaVx5E7lC8f2MvvKToROqPQ3IZvkfkd1p7it4cAYlRej+QPhk/iFZ/c4yTy
	KX1lMEdPsiU76RJtoyZWlDwFTaO/Z
X-Received: by 2002:a05:7300:2150:b0:383:bc0:77ea with SMTP id 5a478bee46e88-3830bc0895fmr2635595eec.30.1795032307141;
        Wed, 18 Nov 2026 12:05:07 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe75b5sm9452407eec.15.2026.11.18.12.05.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:06 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 0/4] ptp: ocp: fix timestamp teardown and DPLL routing
Date: Wed, 18 Nov 2026 12:05:04 -0800
Message-ID: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
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

These fixes affect existing ptp_ocp boards and do not add WiWi support.
They were identified in the public review of the WiWi series and are
split out so they can be reviewed and backported independently.

Prevent timestamp rearming during detach with a mutex-protected stopping
state. Then correct DPLL selector values, disabled-input frequency
reporting and the DCF77 output frequency. Each fix has its own Fixes tag.

Validation used source-derived C tests under ASan/UBSan. The old source
reproduces rearming after detach's disable. The new source rejects late
enables, waits for an enable already in progress, and drains a mocked
active IRQ. Targeted mutations of each DPLL fix fail the regression
tests. The driver object builds against this net base with W=1 and
KCFLAGS=-Werror. No physical card, real IRQ delivery or in-kernel
use-after-free reproduction was tested for these fixes.

The report came from netdev's Sashiko AI review. Codex prepared the code,
tests and changelogs from that review and the upstream sources, following
the request to separate common fixes and validate removal ordering.
This origin information follows Documentation/process/generated-content.rst.

Related review:
https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

WiWi v4 will be based on these fixes after they are available in
net-next; it will not carry a second copy of the common fixes.

Ahmad Byagowi (4):
  ptp: ocp: prevent timestamp rearming during detach
  ptp: ocp: use hardware selectors in DPLL frequency operations
  ptp: ocp: report disabled SMA inputs consistently over DPLL
  ptp: ocp: correct the DCF output frequency

 drivers/ptp/ptp_ocp.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)


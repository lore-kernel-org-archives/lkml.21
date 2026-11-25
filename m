Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612150;
	b=i2tKzKWYDGvoDif6tmJsscfl0v788RA9Y/ccRMfUEVvha3VvJ2vNb8fjoj8MJO4tmb5y
	 vRo74WVnTQR2yQC9TmEAaBbf+RL9SdpsP6DWbAKzq6/g1XdJItFic3ZAONU++3FBHdO2f
	 pZRxm1EQKLK4q57DK9TOHwRTzPPXZu8JvObVrtUsTLCgy3DyWgvBi2SXkkz0UOfWBPfEC
	 qUUOVWB2UzdQlQvGmVo/Lm8w0xpHADQsP96HXKpZuPqUrXS47IqggJ2+SWrMWJdWjUFhH
	 1D8VbW3eAE+JHUoTv8LiITk0a3Krl/cdE7aUQKiN8DE3LOI1sv777iPwnPec5vAgwbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MJicF0N40L/p8mJ4Pm+onD5txxDN49WzZBXuet0XzS8=;
	b=fnXsOdOc4NaL+/EkVX6TWvqrr63lf3t3XxzhjcOGfYwTg7i8OG/WO91dLEOaImB3INKG
	 VIXgpkENbn0i3+7pEZwQ+YTIlEYjG6MLbe4Dj9mYKI4wuy2+MXkF9kK+LX1qg+oyt1Aau
	 pDRolnUTB4WfF35KT+zck3a5Vz4xssBkiLDj3EaBBn7oAJUfdOcPhIRuAgSoIcaLDNfNO
	 f4HwOSbKcC5lPAG4ry9B0j939sLWSYHYMeTyJkyqbxKAIit8wukQ/J5N3vJieXfkFMSP/
	 MXAeo+PBzU49QIgToRPJ2XfBzAEURoYqV/ewu6G6eHAOVEDQzztrZ5EklQt8KyPW14w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yW1xMJUh;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A3606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 459A3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yW1xMJUh
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ee3e658c70so1762966e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612149; x=1796216949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJicF0N40L/p8mJ4Pm+onD5txxDN49WzZBXuet0XzS8=;
        b=yW1xMJUhIaNsmWIeNH9jopmG0amXarJ6nK80pYgmjOWaaKHkVo8ef8EY/+0U7Ib2aE
         Ln6hkyO9PzHiS7+MURY5RbHUQnu+lEmLVGGEx2bhOEOrM4a3EUvLrckeTPCK2KBLxO2X
         svUwpx+UUWPZ4QJszfFODL8V052zjSS400sqA/BfVBwS0CDyrBhDy5WulPF8SNb0DabG
         F08rYjrNOzLBtnU8AH/iMVo8QJZJ83w8oxo5eFOA6OUDQgKN6PB5C+TUMzS5WZinDxq6
         W334DofO/9Y6v00Yma16C/EmMQvOtagA+Sn/EVLDKoCf+fFq7J+1BxdSjUczGLbLWLdL
         DL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612149; x=1796216949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJicF0N40L/p8mJ4Pm+onD5txxDN49WzZBXuet0XzS8=;
        b=GVlA9oNzmyAOfURjpIibw0MPsE6wXWLW0IT1J09E95DDxToCUvZXRCp8TINALuZY8A
         tZfYobOWmWG9yIORt+o9F8YeazInpSFNhhSgby0vIX+a7mew4HuCEx3en9yLxafVhgwF
         CwrcsI/s5DIQ1bi+JSk8Vy9gv+U7WGqz5nJqvVdAbsbbXK9Sz/dTHpSNG/QsMgdKnWJb
         AePtSw3OK23jEJXyVbD2CEz9F6jq91g9LSW6gYBHZdkQMsM8ESRys4hkey3+mA71Za+6
         EIq/v56g7AlrB7LwbeQPzYJHerbxxJjl/MEkVDXsHcKkrNNp0HiKmShOasmWS0c37o/d
         l7fA==
X-Forwarded-Encrypted: i=1; AL+hErHoSSR/pejKPF509i5Z79hAyYftrWiNMgPcdoaomv96xqVzpEHs0VT1Jz3zQ2FNS2DhDVcsUzgnwGPZ/iw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZdngPe4qtd5zbN1mztFUFDFyvI31UYSN98HFUgejsiQh1HUS6
	3/cQfslV+p29bTuD6a8qwzN4LayYrt5z2lg80NGu5Rttx296yV/2L+rr
X-Gm-Gg: AZFdTZeW1s2eo9t1Op4jFjAYfb5/t46YvYKs5+Kf3S3J4VLDhj9QmL1VrBHOgnxcWjw
	IV2L3UJ4FqWedzTvNNyDnwZGGoklgh+TDAzxbOv6XZHp7B7GEyXi6v5PhnJmqeWoCxjnFDIXlnW
	inXAYbKbV3K08LVKpnLNHQGYmB+FTS33tcx8JGwzoCjEaA8HrHA4XR8cyfRTj8fT17MyApxR/Hz
	0R85Z5CMuV9HvuIlWl2zMuFoE7mqoCTiKMZ0SdJQN4Ce4vse5uizIEmUBbKrfhjwVENyU2qy9Fj
	Emmj/JzBeDR1HnBdQJX8ICfMWnN0mT8UgLFjgbCDpCHK4/MivZRctuplGqwRSZ9K8n/vJjEK9d6
	7yhGYnOk8OLb59PcyOUBkIkChKobvqZ0SQSZYKlzAw4cOzSi33v3LzLqKG4H/Xs5z8c5djxHlGR
	hpFBnlTkZNJYi52i67AW7PtzWEUib/H/s8s5Qsuc6uY2iN3OyEKF+GIix2cunHDd9zbUY0gGmOM
	HfikWWr5//CxtQpvqKc92NPrG3JcMgKfdMGEOy9z+MIGYLDssqI2zd7ZeZJR2hjqmLH42bKgGMT
	pm3K/qHuoN9RBh5pHr1Lsj2A5wmFbEsTQw==
X-Received: by 2002:a05:6122:1d4a:b0:5e1:c1c8:9ff9 with SMTP id 71dfb90a1353d-5ee8adf5aacmr9174197e0c.2.1795612149095;
        Wed, 25 Nov 2026 05:09:09 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b60b201sm17299447e0c.14.2026.11.25.05.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:08 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Bluetooth: fix bonded LE peripheral reconnect completion and holds
Date: Wed, 25 Nov 2026 10:08:26 -0300
Message-ID: <20261125130828.18441-1-andreiab9019@gmail.com>
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

This series fixes two issues in the Bluetooth HCI layer seen when a
bonded Windows central reconnects to a Linux LE HID peripheral.

Changes since v3:
- Rebase onto bluetooth-next at f57f78086ab5. IncrementalBuild reset to
  origin/master, where the newly added MT7922 data-length block changed
  the context of patch 2. Keep that block intact and apply the same LE
  setup check below it. Patch 1 is unchanged.

Changes since v2:
- Rebase onto bluetooth-next at 6a40daae69b0. The Bluetooth CI bot
  could not apply v2 because the key-refresh configuration code moved
  into hci_conn_refresh_key(). Update that shared helper in patch 2 so
  both Key Refresh Complete event formats use the same path.
- Preserve the LE setup abort checks in both feature-complete handlers
  on the new base. Patch 1 has no functional changes.

Changes since v1:
- Refresh the saved synchronous request after timeout or cancellation,
  preserving socket references across controller reset resends.
- Keep the LE feature hold across encryption and key refresh. Explicitly
  abort failed setup and prevent later events from reporting success.

Both v4 patches apply in order with git am on the pinned bluetooth-next
base and the GitHub workflow branch used by Bluetooth CI. I reproduced
the IncrementalBuild sequence on f57f78086ab5 using BlueZ's ci.config:
make olddefconfig, then git am and make net/bluetooth/ drivers/bluetooth/
after each patch. Both builds passed. Local model tests pass 152
command-dispatch checks and 66 connection-lifetime checks with GCC,
Clang and ASan/UBSan, including checks for the MT7922 path.

The v2 backport to Linux 7.3.5 passed repeated bonded reconnects,
approximately seven hours without observed connection loss, and Windows
Bluetooth off/on. Those hardware results are from v2. In separate
Windows suspend/resume attempts, the test HID application could still
wait for an HID subscription after BlueZ reported a connection.

OpenAI Codex assisted with analysis, patch preparation and tests.
Sashiko provided the findings addressed in v2.

v1: https://lore.kernel.org/r/20261121033104.441146-1-andreiab9019@gmail.com
v2: https://lore.kernel.org/r/20261124140956.15296-1-andreiab9019@gmail.com
v2 CI: https://patchwork.kernel.org/comment/27404265/
v3: https://lore.kernel.org/r/20261124211127.41609-1-andreiab9019@gmail.com
v3 CI: https://github.com/bluez/bluetooth-next/pull/1221#issuecomment-7151355640

Andrei A. Bykov (2):
  Bluetooth: hci_sync: keep unrelated replies away from event waiters
  Bluetooth: hci_core: preserve LE feature holds across encryption
    events

 include/net/bluetooth/hci_core.h |  9 +++++++-
 net/bluetooth/hci_core.c         | 16 +++++++++++++-
 net/bluetooth/hci_event.c        | 36 +++++++++++++++++++++++++-------
 3 files changed, 52 insertions(+), 9 deletions(-)


base-commit: f57f78086ab54f3b3122fbaeba2c842ba7bb6d00
-- 
2.56.1


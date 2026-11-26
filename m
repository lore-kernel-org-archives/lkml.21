Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719602;
	b=AsukJouMMK9gdXLTJRPMSKU6EprLqFi3P46ev1TkxfhwiiYn+zrpg7Fue4pyVwNJwTG5
	 5C7GNRHr9Sz7cscPFB8hJ/bbv5Np6WzGfffRDJiAquuVQQIrGqyeQmS926Qn/CCzag1vZ
	 RLSO5wdpDNKbaBZVoJHcju56d5sg8tK79Czfv26Vf8VxorsPpgWwtbEV92rkDzuHa/phT
	 J+xADmiJPr0z9G4E/nMoWQEEbGzz+DmohDoxFFiCSj4cFE92P1PaHRElCYq6SxCEvXMnK
	 82GyXHQ6q31YeDzSe9AeuP7hYg8qc4Z8lhBUchF/YS5sVZMul9xlOXtR0JBin7FxTUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719602;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=whyYBFaRg7vM5AgWVPAf0VahbrPtCCLkEesp43DsjqQ=;
	b=SDeMDv9O2Ek30op1clpq2yGDCGCc36KhdwIMc22Sj6JGahgndVBssZdAs+MtGpTJP5BN
	 NlarS+wB3P6ZG+HV3XrxcckQmcLd0J5a7hULxbXgHVZj9NPu8aBWggaWG0TJ9PPOJjmCp
	 +5hkSTRwvXSz1LQgCzGksnVqyMguJs0IE9nVimIQ3xDg/fb0abWXCcNMBz8QO+Mr1bkdf
	 PIyoJnx7hk6SZBOeIAN1TR0mSKRD0MUAJ9gImRPJz7elwkMP8ZPj6J5ZT0akUF6lGp9Jy
	 adNqCuKZWPmEroIy/QTocrlFdXDVHWi1QEELeGz8fQJDd7QKePMFmqOZn8kj66O1g9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b="QmgCDZj/";
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD544606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD544606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=QmgCDZj/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1795719599; x=1795978799;
	bh=whyYBFaRg7vM5AgWVPAf0VahbrPtCCLkEesp43DsjqQ=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QmgCDZj/m7tbtM278xysX2kjWvUTUrdv/K+i+aRJmkQE6ofnp61zKnLi08lnZ7117
	 +XWKetSWyCrANrkm4XImz/lYhCUvt+6zyGEtgIuYdHQ0ZI2rVT3Iq21JCsUDMq++iW
	 ky+GL0UgPCd8w831XMQLgA7JRT6Bg9KkysXr/QIcb7Wuudv6V/Xgqw2/axK0Qve32I
	 jR5F8h3B7pcMhBpArVThTcoYYgtnK+KkeS2gCjuRTbu67uulNvy7rbcMzw1s0H5scb
	 8CZAaLYIiHJ5TEt73ReFdMCYDfboBghy2JM5yuHqt7Uq4qCANz9ytrTzHmdqsjDR7W
	 YrF8ZNGXRJnzA==
X-Pm-Submission-Id: 4jb5T91Gqfz2ScXX
From: Michael McAllister <me@michaelmcallister.org>
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: brgl@kernel.org, enderaoelyther@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, markus.probst@posteo.de, mka@chromium.org,
 phone-devel@vger.kernel.org, quic_bgodavar@quicinc.com,
 shuai.zhang@oss.qualcomm.com, zhaojinming@uniontech.com,
 me@michaelmcallister.org
Date: Thu, 26 Nov 2026 18:59:41 +0000
Subject: [PATCH v4 0/4] Bluetooth: qca: Power off WCN3950 safely
Message-ID: <179571958163.81221.3368253997777320112.wcn3950-poweroff-v4-0@michaelmcallister.org>
In-Reply-To: <hvwqozj3r7n7igxw5qogu7xxya4fkhqanb334sroj37ufzdizu@qarvtlkkulmj>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
 <hvwqozj3r7n7igxw5qogu7xxya4fkhqanb334sroj37ufzdizu@qarvtlkkulmj>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

On my Moto G10, turning Bluetooth off leaves its four regulator votes
enabled. This series adds the missing WCN3950 power-off handling and fixes
the UART teardown ordering needed to send the pulse safely.

I've split the unregister/TX fix out as requested and rebased these four
patches onto the current Bluetooth tree, including Zhao's flush and close
changes. This series depends on that standalone fix.

Tested as a module backport on my Moto G10 running 7.2.9: six Bluetooth
off/on cycles and driver unbind/rebind with Bluetooth both off and on.
The four regulator votes dropped to zero on every power-off, and Bluetooth
came back on each time. One firmware download needed a retry and recovered;
the original driver also needed retries in the same six-cycle test.

Thanks,
Michael

Changes in v4:
- Submit the unregister/TX fix separately from this series.
- Rebase onto f57f78086ab5, retaining the merged flush and close fixes.
- Move controller TX flushing into the standalone unregister fix.
- The separate Marvell prerequisite from v3 is now upstream.

v3: https://lore.kernel.org/179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org/

Michael McAllister (4):
  Bluetooth: hci_serdev: Track whether the serial port is open
  Bluetooth: qca: Power off after unregistering the HCI device
  Bluetooth: qca: Handle failed power-pulse writes
  Bluetooth: qca: Power off WCN3950

 drivers/bluetooth/hci_qca.c    | 34 +++++++++-----------------------
 drivers/bluetooth/hci_serdev.c | 36 +++++++++++++++++++++++++++-------
 drivers/bluetooth/hci_uart.h   |  3 +++
 3 files changed, 41 insertions(+), 32 deletions(-)


base-commit: f57f78086ab54f3b3122fbaeba2c842ba7bb6d00
prerequisite-patch-id: 4f7b2f10b0911886f60ec40656c453138c3570f0
-- 
2.39.5


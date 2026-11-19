Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062445;
	b=ItEnrpg7WIlmY9WBUIU9wol38zdkFDr6P66acCcuy9s5yyBebAincf/QlQP516x4VkPD
	 sDo/yXOqVwCueb+Svw1UnCo4oQxxXdfk1pQbltwj8lQPsRPYdzyyFQ0j+K4ush/Zrtb2e
	 RePvNlVQugY3g5f/tRRKxE4k5Zh2YyxL39fY5hq58hVCPIygPr3Slld/4H6+HKmBY56rS
	 b0lKSs6CiRdbGvk96VU+jTwKGl+N9P2MR+3Ga1XxBWdmVm1ygIAc2wVl592Ih1Pm80ZlH
	 SQKcEgrWUi2wmbE9jKENMadcGXIK9gd/wdVDO/JHC5LafjjwafNMb/0lqA79pg1F4nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tSiAuw+fLK+lCzb9iyG0L3kqF9lC30AMcxOsyhH7NTo=;
	b=wOl58jAtT9LYD9S2n3wUBGlbUkqr/Vo3bzb6UTXwHzbNdLwIQc6AmAVJrzmIiALyifbe
	 z0Pcnk06ddz81o9h+6psgasy7tiBaSlxAAfO5asWa6wMATPHCh47NcZ+PankwzBJKHiT2
	 7U39h7MHXkaMThDyDCK6u/lBXMGe20BWsCpPGmoGOBdEXh9UMLax7zKPSLUGlBVJg/0OG
	 rYiWBzN9gaJNmIsEr5qc3qIhnZbmfpfenQ+0DPUw9EKK2uT/RYk1ZPRHibIl1XVeIX0Dj
	 QHgVFMlWaA3TbCHicgQbOiISZGWlpetkiQJMa/Ox+CLwI3UZPIpfd4eMhhS4JUrgLzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijSkVf8o;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01F560A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01F560A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijSkVf8o
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a070781f63so971511b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795062444; x=1795667244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSiAuw+fLK+lCzb9iyG0L3kqF9lC30AMcxOsyhH7NTo=;
        b=ijSkVf8odaohJDYaOEx6cqXbQnlhIQihKGsFIcJFz61cKPYnyl/41fSLYGuGRj0yNp
         EucHis20gwjVUWkkXwIHvmFksgxpYo4UIZ1Z+HfDGicuBzd9sbnYlOiROjGOvX/r0/BR
         nWK4sGy/EebGcVfUgzS6nuq6nFM3D0/lYWGH23K4xxgh3GrDCzJOrehT1rtuLLq1jTvV
         Jfr/FKkcun3J1Adln7brtzHttpIXCrwZUC9NyUw+u8TPjAgcHFB1uqgsU7YDECUx6VHx
         1Xe3/SNeU4rpdz2PzM+EhKCL3beVemkhCSp72+lL/5/uTNW002G5H2N2aFuGyYBvtQ+l
         5vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795062444; x=1795667244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSiAuw+fLK+lCzb9iyG0L3kqF9lC30AMcxOsyhH7NTo=;
        b=YIRsw/s4VnG+Zd5AbNjniwCmJw57xb9Kz0eG4azexZbwj8p6OLSNQMezrlL+rNK49U
         y+/fgYgjOrfwssY1n8XHnpmHimfQIZ63I1pR6jHEq9gzOzkXG+4Z0lWhVoyhcuOrDa1/
         5oERD1qWE2D6LhXHq+n9FsAUWfHTanXySg++ejh+6ICt13CND5BMtnv93z2Cl6K7YjzK
         nfs1tU/lhqTq+b09abShbjnNKMmNjeJtfn0zt8i3KuqIiWWuvRa8/IX4gseKYwphNdRj
         QNS69SMm9pBJkfkyBVQ1cmBS6DbPzhuLSHroKQd4lRuU7ncsBOD18Hh9b29u0meVN5mE
         g33g==
X-Forwarded-Encrypted: i=1; AL+hErEjRx8ATa78o0QPVVCriiIgmlUQ9/uriIv5ecs3drWbHJd8KA4/NX/rvymonLJlZj0O8qBTCIBK/mAYF3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pjJ6wv1SGE39ETXsRN5rT4B2VLl1TK385FSrzuK6y5+TF2U1G
	a9ku3j7j46ZDVEvDur0Iaczamwr5emZKNTUBNclN5rp/fVbVoClxY9Ab
X-Gm-Gg: AYBFou37vmZRrNWz+3++5IPKsUeP0LwuZqzsf9NJyjygYllbVs9btPZi9DUocmlEYyo
	q0yIbhSiOd1j30zFA9dkMO/ScKbMly8wu4g2TSVqTKntew3w4mQa8Rzw1rF44Uo4AboRAI9iXyq
	2HXAhsb2oPQnjGupbF013aYUtIAZrcxQmc4DrRRkF2ntCeMNOtE/a0lBneK7yidHaPnPctnhUxl
	fgr/TmnZsOSE1K5w8Vz92wYKbctet7KKGWo3Q9Ns+DUcZ95EV4mwDHS1s2ZsM3tTfkxLVswR1DY
	AvIDEzga3SHDNqR+Kg2iL0ouhcoEOqHfvay5V8rq99EzsTe3pnoOSQsMDDZMw55TJ776md5xMP+
	JXg87ngETOyAiwkX0JyEnVGpflmoWdmbIE1TDo/LufFEjdJ/W7pPzzbRKe3dLXeG15J50r+3gti
	ju4rU4Wn84KbaBbttHanWspplgCkAFllI+wcHkqI4u18iJ5v9rKZ2KN2FF8c7cNE6JOH2Ma9DzQ
	uztPfeoZp089/IWH8DY+whZzgJWzFfSkeEvzD0gjYHx9iUUGHfls7+gv+WxuN6FQ95lBG7IPqSn
	/4+xZjmWcEMhtEUj
X-Received: by 2002:a05:6a21:47c7:b0:3e9:176f:ab86 with SMTP id adf61e73a8af0-3fe980f7bdemr4008545637.44.1795062444071;
        Wed, 18 Nov 2026 20:27:24 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35830bsm2077636b3a.33.2026.11.18.20.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:27:23 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	m.chetan.kumar@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mail@maciej.szmigiero.name,
	nihaal@cse.iitm.ac.in,
	David Westen <davidlwesten@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] net: wwan: iosm: fix S3 resume by re-binding the driver around it
Date: Wed, 18 Nov 2026 20:27:14 -0800
Message-ID: <20261119042714.505405-2-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119042714.505405-1-davidlwesten@gmail.com>
References: <20261119042714.505405-1-davidlwesten@gmail.com>
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

On platforms where S3 cuts power to the WWAN card, the modem boots
again while the system sleeps, but the driver still treats it as
running. After resume its execution stage reads BOOT, and by the
first port open the boot code has crashed into the CD_READY stage:

  iosm 0000:03:00.0: PORT open refused, phase A-CD_READY

The modem then stays unusable until an ACPI reset.

Unbind the driver before S3 and bind it again after resume, as
commit 0b6f6593aa8c ("net: wwan: iosm: Fix hibernation by re-binding
the driver around it") already does for hibernation. The driver is
then torn down while the modem still answers, and the modem is probed
again once it has booted.

The target state isn't known yet when the PM notifier runs, so the
default suspend mode decides: the driver is re-bound unless "mem" maps
to suspend-to-idle, which keeps using the suspend/resume callbacks.
This changes behavior in a few cases:

- On platforms that keep the card powered in S3, the modem is now
  probed again on resume, which drops data sessions and recreates its
  ports.
- Entering suspend-to-idle or standby explicitly while the default is
  S3 also re-binds the driver.
- A suspend to S3 that calls pm_suspend(PM_SUSPEND_MEM) directly while
  the default is suspend-to-idle is not covered and fails as before.

Fixes: 1f52d7b62285 ("net: wwan: iosm: Enable M.2 7360 WWAN card support")
Cc: stable@vger.kernel.org
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    Changes in v2:
    - New patch before this one: cancel the ADB timer in ipc_imem_cleanup().
    - Describe the changes in behavior and the remaining limits in the
      changelog, and say in the comment that the modem "may" lose power.
    - I also tried detecting the power loss on resume instead; my reply to
      the v1 review explains why v2 keeps unbinding before suspend.
    - Correction to that reply: the XMM7360 here does use MUX aggregation
      (CP capability 0x300), so the ADB timer is armed on it too.
    
    v1: https://lore.kernel.org/r/20261116031148.333990-1-davidlwesten@gmail.com
    
    Tested on an XMM7360 (ThinkPad X1 Carbon 6th gen, deep sleep) with this
    series applied to 7.2.15: the driver is unbound before suspend, and
    after resume the modem is probed again and comes up without an ACPI
    reset. Not tested on the XMM7560.
    
    The investigation and the patches were done with an AI coding assistant
    (Claude Opus 5.5). It read the driver and added temporary debug logging
    to record the execution stage around suspend and resume. We wrote the
    changes and the changelogs together, and I ran the tests.

 drivers/net/wwan/iosm/iosm_ipc_pcie.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
index 49052eb511ba..13e81012d818 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
@@ -534,12 +534,17 @@ void ipc_pcie_kfree_skb(struct iosm_pcie *ipc_pcie, struct sk_buff *skb)
 
 static int pm_notify(struct notifier_block *nb, unsigned long mode, void *_unused)
 {
-	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE) {
+	/* The modem may lose power in S3 and S4 and boot again on resume,
+	 * which the suspend/resume callbacks can't handle, so probe it again.
+	 */
+	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE ||
+	    (mode == PM_SUSPEND_PREPARE && !pm_suspend_default_s2idle())) {
 		if (pci_registered) {
 			pci_unregister_driver(&iosm_ipc_driver);
 			pci_registered = false;
 		}
-	} else if (mode == PM_POST_HIBERNATION || mode == PM_POST_RESTORE) {
+	} else if (mode == PM_POST_HIBERNATION || mode == PM_POST_RESTORE ||
+		   mode == PM_POST_SUSPEND) {
 		if (!pci_registered) {
 			int ret;
 
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625741;
	b=gn8UBBnsNV6k/piTjSCTSyLKUIqiVGLgd70zQDl8otCTlCfftnhGzyzLPILuACsAUV+C
	 Vq/jtCy9cPQoJYY+93CWuAbroqwNij/A/SjQN7ijFk4flaTChYLJDH0hcaHdlnzFL4HQp
	 xXEuKJDouyox2pZx4/vLzzat2/tafRrADXn8g5fyeBJ23VyxzmHxKAxZhpMdeLVEDbBzY
	 w/SXT+ZKacPJx7PDydenvMIpX2mHgPU96IbPBkJrH7WF29Fay3QQ/XQiSXykMdHa+bqpE
	 WLbhSPZZ7jXDYL4yyzyRtJcDYp3gSFOWa6VnzZfz3zy+oXY8yXk3L9PoX6ObY31i8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=C3ZMDSrx8g0JCNi5Ej21a6Hjs+LnLXlFTuwwUzff5rM=;
	b=mBwKHmS9oyeetXTro75HkXTrSezQqkDXPOu3spLSm2lA0dy9XAoS3uOZ5BAXRCDnchsu
	 Ez5SspxyEM9KbAMoBDw5EAZ8wTsMIGPcFFwN/d4gmqPqZAN73tvVepFsBk5aJ8uoQ5GOV
	 JO4hLE88E8DWDxBQ3OgpynFxkHPEFS76OyXHS21rk1KEmKQrRfKFb7oH3FJa6X1wpIO91
	 +D5dyguQe5mXBqbT/PyROM07wpAFd+XNCwjL6suPGrZRGWbXd+Z8R3uEaboHSCAa0/eii
	 qC2jkJCcWU3qryrO9ZaPZL/lzcoqWrPKLXzJnNP39XADVlniDg3Dg5+C6y5qairBjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEIGhgiX;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C80606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C80606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEIGhgiX
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4e246acc2so43380947b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625740; x=1796230540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3ZMDSrx8g0JCNi5Ej21a6Hjs+LnLXlFTuwwUzff5rM=;
        b=FEIGhgiXkTxMnyIjEhW8qtAK9qKr1hrK16C27sw6KyNhjfFf0Fiadu63at96RsdbZP
         da3W4bNQFfHCXIX5Q4iCsF6gLWX5nY/fpB1PCxjbFfzw6vH+5O02kkl3pYY0BsplKPR2
         DOQP7fQv1aR2Om0g42bJBAk0au/laDJ2KrRQ+4go6ipi7+rhoScyv8nQORg2tNxQ3otj
         NlHcn/lQSC0Sy3imp7SQaD+FMFWU7/1HxIqvaYiFWoToJXSVQu2acsdjf5jgcmf3ixTV
         B84lEbLf4y/WzsaoC4z6tmeG8yx0qsjtDCAzgIVuD/K1nFfUiunWs2aFW+mpcNcUigXE
         uAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625740; x=1796230540;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3ZMDSrx8g0JCNi5Ej21a6Hjs+LnLXlFTuwwUzff5rM=;
        b=MBopfi3v4oQTH+bkMsoPcoPFVH62wD2CXV7As4pTdp6wl3HAReQZlHvuCirXMOEcuE
         I+9eC3ZK5U8iHPt3iUGkWi+Y0f+Mu0CjvMXgELxYXNr2907eAVak0wAAnU7/m76a8aT0
         f0A+weAXRsAY1x4Bqb2M0ZoPedWgMkTryM5oOIUhyRjdVXuF/SeGZIX3mDbEFowu4RAO
         8NqVaecMTP45qrbcAzsXRd+OXbEu4EmMr4nDhPNlB7Fg7uJZFnFynkWIodzrUJbf5VxQ
         tB3qfRxrFZedSWtxQ3aTOYn3uyE2/q/M24og4rXgrw7Sc+UVoQJl4vDZl4PJX/iYwdj2
         qabg==
X-Gm-Message-State: APuU4Z+Qw4SaDRFaxv6JTU4BBFavmmZg3/VE9+kkrcDz8UTA6Y+6qK01
	lluKYQIovYdvQZEwUpXWijqSA3ulq+I1Ct8xK60b4egzaBrZ1+jS7cLXCCFetNE=
X-Gm-Gg: AZFdTZc0wuie9SAvei2t47lJ9HfJFBcKC/ufaF/JRRkqS+ZeSxdDpewUYW0RsCQA7Wd
	8rXrOs49PXEVic9LTeU/dqPbJPzUeIRUhIRdFn2jLcEUtWLVnVzIfRvmwVkB+e5k6gevvs16igC
	St/h8OKQWGyWaawRPLMhYgPydmwKF17bP/UpsY8LywrMYtVeLHnGhY++6AQWewsO0CkOpgGvZ6B
	wUn72a6GaQMp7FLrsuB+TEkq0lfce4my0XYapnkVZkP62XrlxDI+x3ZnzZD90dQSn27gojHeYtL
	T3jfXW5olHT+BU2C0iA8AkBUqSOVjHXD6+II91F0j4OqxETRnY7+QN8A5AXCveZjxZSv3CTcCEu
	kMxFlBUw9JDfYRzXxwFVTIwzpUaUJvrnl7Lah8E4TsUB5cOHIQ8CK6ZjErhaUNuYSKOvuuUPK4e
	erHTl6u7x+moOjrwZUaHh8jJap+nsj3O4xIcJZMHTfmngacvOhSb2MNaiHwCbDQx68MFff2h0jF
	TzhgPFrY5KNNxKLN771OtTH7YkR+2+G0tmgb9UozhQOQM7E/SHCgSzIuYvwQ+EEf2T0kyFCHRau
	i4yyS17QMIDFsg==
X-Received: by 2002:a05:690c:680e:b0:8b4:dc54:1d37 with SMTP id 00721157ae682-8b52042e7d0mr76699877b3.19.1795625739538;
        Wed, 25 Nov 2026 08:55:39 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:39 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] MAINTAINERS: Move DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST] entry to sorted position
Date: Wed, 25 Nov 2026 10:55:32 -0600
Message-ID: <20261125165536.792563-6-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST] entry is out of
alphabetical order. Move it between DEINTERLACE DRIVERS FOR ALLWINNER H3
and DELL LAPTOP DRIVER.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37087eb6e40a0..f2468dde0d754 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7431,6 +7431,24 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
 F:	drivers/media/platform/sunxi/sun8i-di/
 
+DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
+M:	Andreas Hindborg <a.hindborg@kernel.org>
+R:	Boqun Feng <boqun@kernel.org>
+R:	FUJITA Tomonori <fujita.tomonori@gmail.com>
+R:	Frederic Weisbecker <frederic@kernel.org>
+R:	Lyude Paul <lyude@redhat.com>
+R:	Thomas Gleixner <tglx@kernel.org>
+R:	Anna-Maria Behnsen <anna-maria@linutronix.de>
+R:	John Stultz <jstultz@google.com>
+R:	Stephen Boyd <sboyd@kernel.org>
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+W:	https://rust-for-linux.com
+B:	https://github.com/Rust-for-Linux/linux/issues
+T:	git https://github.com/Rust-for-Linux/linux.git timekeeping-next
+F:	rust/kernel/time.rs
+F:	rust/kernel/time/
+
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali@kernel.org>
@@ -11959,24 +11977,6 @@ S:	Maintained
 F:	Documentation/hwmon/hac300s.rst
 F:	drivers/hwmon/pmbus/hac300s.c
 
-DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
-M:	Andreas Hindborg <a.hindborg@kernel.org>
-R:	Boqun Feng <boqun@kernel.org>
-R:	FUJITA Tomonori <fujita.tomonori@gmail.com>
-R:	Frederic Weisbecker <frederic@kernel.org>
-R:	Lyude Paul <lyude@redhat.com>
-R:	Thomas Gleixner <tglx@kernel.org>
-R:	Anna-Maria Behnsen <anna-maria@linutronix.de>
-R:	John Stultz <jstultz@google.com>
-R:	Stephen Boyd <sboyd@kernel.org>
-L:	rust-for-linux@vger.kernel.org
-S:	Supported
-W:	https://rust-for-linux.com
-B:	https://github.com/Rust-for-Linux/linux/issues
-T:	git https://github.com/Rust-for-Linux/linux.git timekeeping-next
-F:	rust/kernel/time.rs
-F:	rust/kernel/time/
-
 HIGHPOINT ROCKETRAID 3xxx RAID DRIVER
 M:	HighPoint Linux Team <linux@highpoint-tech.com>
 S:	Supported
-- 
2.47.3


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630726;
	b=mskj6937RNGM8oAGL5BlUaP4tq1efDuUfWGVY3NqzKfmaHvtlH0jdlMsOmwplQLhHYjL
	 Hhr1UGssTfmNuhdpIKhKZv0ln1OD2H7grqRNdnRskZOU2XFfrGwmVJaNhE534pOHHvqxS
	 Bj0dgbODUhtmIfu4gmNC7WTlgGKqxPw2JVqxHRcmRLPr+wFJ2pGS2Glc/WWLSFyJSyg7W
	 VBZtDzZK17CQ+84VRFASNG2bwrNmlxT+KFMJE7yS5k8e9LDRlLnJu8rpgMrcXlmZON2m3
	 hWkK4JQ/GUQJtoCfgbf5X+1dcWBgEOxZ/TGjPtzqhavIRAl9FjjRCGwnao2xczFvtHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630726;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=RYQTMByA5YephdJvrWKX4Z6R+MDeNth5iMn7suE12p0=;
	b=1yaH8az1+Kxtw+oM6wwyveX83wNryZWpPU977WgBHuWwRnt8MJRKyLToetyiD7+a4a37
	 xRayoYJfzelkodCabtvKvVHJP+AmUV/51qvg/dyeqHqULfOo5Ci2X+Tt1TVcLIB7VOsNP
	 CzKVgSgKWjj/Ei/rlSpxUN74UHdA2uZOr0ldqq8bPUJJKjbrC64lmDbNt3RPJdSkesSzO
	 EordlpsSMUIXGHpjwFPjtV4Qiotut19CnUOtxq2t0zIwSskYi+vCmQ4qNPleEp4kt9I8w
	 4V5SE3wNlQdt7cTQ7mQo+I6jCQ6OKmR0HnkcT2cX0SD1XwGa8AZrFQOTUlOcRWAnUrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=N8PKdLbj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="/5frUvmn";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9598606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9598606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=N8PKdLbj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/5frUvmn
Date: Wed, 25 Nov 2026 18:18:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630722;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RYQTMByA5YephdJvrWKX4Z6R+MDeNth5iMn7suE12p0=;
	b=N8PKdLbjlG2HbTjgf/w6ibbEFtCxauSY0gzP99iucMMvPX37s74kCf6ph+uZftrReCTk82
	f8dZ3GXTFeAnc7LdjzZsHVkZ3/cYV4K3BOqptjBPpzqAY31EHVPPp2A7tq3v43CBA+p7gA
	LWNHRRaUaLVCvBQdekDCQKz+Cf5mAnzFKjOzFhyEX043WLAjoExTXCXCiJXKYZL2YNsaff
	s298o/7d44NIm2hqkt6gEW4fjJPtsd0hDngbx+v4vpRKIGF9l6sgP1zgvGHB05XdE9qGQT
	8XbF3BAd0CvAoDzQLjU8IdGkjFRctiN1TpOx7V5ZmRUvxlTJI4NqdKpiDVxg/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630722;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RYQTMByA5YephdJvrWKX4Z6R+MDeNth5iMn7suE12p0=;
	b=/5frUvmnK+8M/wUY9OX2cA1lZnoEcWwn6PeHL/yjHvPiV9mqeBHOf2sJRmDT1TLykBgw2j
	+YO5WM5R1LpbMMDg==
From: "clocksource-bot for Pohsun Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/timer-tegra186: Use NOIRQ suspend/resume
Cc: Pohsun Su <pohsuns@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
In-Reply-To: <20261116-tegra-clocksource-v1-1-e7988fc2a7d3@nvidia.com>
References: <20261116-tegra-clocksource-v1-1-e7988fc2a7d3@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563072092.92412.11583585220619176875.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     37233d9bef2b5595d6f0f3059177b8f40a15790f
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//37233d9bef2b5595d6f0f3059177b8f40a15790f
Author:        Pohsun Su <pohsuns@nvidia.com>
AuthorDate:    Mon, 16 Nov 2026 09:18:56=20
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 17:48:41 +01:00

clocksource/drivers/timer-tegra186: Use NOIRQ suspend/resume

Update the Tegra186 Timer driver to use NOIRQ suspend/resume so that the
watchdog is kept active during normal and late suspend/resume phases.
This allows the watchdog to reset the device if any issues occurs during
these suspend/resume phases.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261116-tegra-clocksource-v1-1-e7988fc2a7d3@n=
vidia.com
---
 drivers/clocksource/timer-tegra186.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer=
-tegra186.c
index 7938fc4..5ac724b 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -589,8 +589,9 @@ static int __maybe_unused tegra186_timer_resume(struct de=
vice *dev)
 	return 0;
 }
=20
-static SIMPLE_DEV_PM_OPS(tegra186_timer_pm_ops, tegra186_timer_suspend,
-			 tegra186_timer_resume);
+static const struct dev_pm_ops tegra186_timer_pm_ops =3D {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra186_timer_suspend, tegra186_timer_resume)
+};
=20
 static const struct tegra186_timer_soc tegra186_timer =3D {
 	.num_timers =3D 10,

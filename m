Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169692;
	b=XFh73K9msTANHat0vElABbnU9Tz8PvwtGMh7Baz8d5PgufM14xLf1aJHR4fR0DHbhYd+
	 gHT2+hFiPPpXq6Ox25+Wl8meemPrvRdqZFDE1w5b/r/YljcaLE4CR1f+eBNTgh4wbCxMQ
	 xFURdVQx+XafEzRljR9hghKnG9UL5b6jSnnH7mpcJMF0sHLmyryGOIg/IEDH023MXUAgE
	 XvGe5LN+2TOU/QesfOk0hropSYydagqGDMZkux4fWdZPpTphX9o74KkV+sClT3BJ8bout
	 w80iijyR1VoZnXQXXsQ32jBBxrWNEwiz2Cb+rtxUW/RZAySKIZtoyKsmasZXZwEnjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=05m77ewUjEQjR11x4Lg0Xbn6thLHoASqxgS4p5L+QZo=;
	b=XTtQxTSd1Xj55oE2RRgKSP6sait2s6/5mOTNbThoF1pnm/vJLW/y8FEAA5favC2RW+tY
	 W/x7arSNKvj+lCZxnEp/RxjYtxABhjqYf1/yjoechOaND7dmG4LX1Rem8VH3r7X9qf8Em
	 cSzJ7Q4rjW3Ec/qQERuEG5Hdlri/9TG6IgUlja+L3wuxUKeLj4EBFtlujT9hZ9AeTEQWr
	 5/jQvB0oRwNDEdvBKrHb42oFjNAQGG4cI36f//2FVdg9hRjuqsRF9R2uVQJ7WSnCtMwWD
	 LwqH22ns95AjDXMCL679Rjo3dF3ZHw2Y7JhIk9sxv/Zry/sIBRlyv4EsszG/npkAwbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3tqFuje;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C28606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C28606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3tqFuje
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3b4944abeso627372c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169691; x=1795774491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=05m77ewUjEQjR11x4Lg0Xbn6thLHoASqxgS4p5L+QZo=;
        b=h3tqFuje04oFX7f0+T8DrcMYgFj86bbaVCl9gp3swMf/wTKU8ocuPim5wTVz/33+4w
         MAsOcRIFDz8u6GUQ1xPjomKE5D615nqnjQ8t+ff943Zx1+DHIwHEpUlwRWScttq/JQC4
         g+5fECVfe5X8xd2vYqnrHWM0hQzqpCHyYg1fBIFZbOflQ+vZNiFiHw4eWZuZvO+ktHqY
         1XQivpIWhDm8J3gk1ndGfDN0GzYFGMUruEYDITygbzIfIvg+9mAfUAhCK84allsHxqQe
         Tp1PSq7o3wuvB+MKpv45wYK58MSa1idAR2QY1rqovexR0OUnCs4MmVsXsynW0gzCrkDd
         AWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169691; x=1795774491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05m77ewUjEQjR11x4Lg0Xbn6thLHoASqxgS4p5L+QZo=;
        b=JMp+ZJtasTHMeGIzQytmLE1fuihWSPVB1RLK0Q1QMaJI2kDE+u5tqo4n0ZYrrRpwc9
         yKmNvX6TVwH98yM7zuhEEgr5nZIBfyDq5jRph02VxrzkQ+50MnHVkFg6RyTE+I6JqDNW
         jCyZMNRwYEP2u0ij4KECuem+P7pCbgQqF/k6D5hzKpZ4KDm7bx2nSBEaFyCVkyKFwxFz
         X/bCzMpd9r359TFhIs96LRFfMFJJxtXcLBuOJNWmZWrVbraxWzZsRGWEOZv0ogNsCvCJ
         pEsclWovqDx0OBipJclBrAj/FKkFWJR9QqzBtLwEjM8dw9HStWPVBIW5tW8PRTgbXRZK
         9xsw==
X-Forwarded-Encrypted: i=1; AL+hErET8sMk/nMdpCmN9KvVTQ/h5n2Ul0GGHsj9LhqPah2SEM/0NfIe3+Zq0z6V4lxL5hxZlwDdWT5ZVNs3g/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2NlD0liuLbJMgv1p5/ZB0S2uDc2MfHBg683fo3OGGbsJgPs+V
	Cicq2wfiSgVcg0MuB1kNTb3fROE+MCWBz3gr1+50Rq9rmrbPXEgVKOgv
X-Gm-Gg: AYBFou1XfTtVNhoZrIhHGJqfcmUXp/nAYX7XLm6tI8mtgF+O30Wq00VLf4+v/Og070Z
	2LAPaxW2f+fLiYHUFXHDD3uXJE7lmUeOIOEDysDWn8VQJnNfc46Xngh68C9lPoCe2xr3X/pWykC
	z2gOrK9gGZujjqDPIvoZhQAHWCj+qsNNUg/V0JH/iRVkn4uM+R5sXjQIx+hq1Tu8RduK/gDOTTT
	bcIcWP5IARcXGY+M/dYkcqxkdGN7FWLwN/VoWeR/m1DkVfji3DDXiEwYBHhcucDNMmqYR94qA9L
	zBKEcKEeZwvcwS2Ra40uhheOQe7+7b3zp0s22MSDE0LBNDmaLkaTmOVAFO566yNNSeFNkxPzZ+G
	bH/8s+hEYEwUjaNKIO1YHnM5HRPHX+9TQmbYEkgO7yTokiBoeh7VNP3tWvKsgdcmjPZHaDDT1Vv
	FfatTAU2dMxDGo83K2Y3wy44T+54QVKBU36B7VXINwyCbq0+Fh+2qb7Ls+YtCgDUx+4nQNTRn4D
	l/x0O4de7EOHZlqhiSbHFqxTvDOMpF/LCnVasDmLgiSoV7mFQYIVVU8QlbOVLIAPhQVHdw3w+B+
	BaWVW56eghSHfo7paa2Ae/WPPMTsQqQfpNECsoC4py6Bn6iJP2dp0NvdWVMbcYFkujSVT3py2ES
	n+HWpaQJdE7TwQaMIWOGLSQ0qmLWn3rqRh+t3WYrOHsMBi0HpkePGVJe4H+s=
X-Received: by 2002:a05:701b:450d:20b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b558384c12mr1780334c88.33.1795169690678;
        Fri, 20 Nov 2026 02:14:50 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm5989567c88.6.2026.11.20.02.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:14:50 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: giometti@enneenne.com
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v3] pps: reject N_PPS on pseudo-terminals
Date: Fri, 20 Nov 2026 10:14:39 +0000
Message-ID: <20261120101439.45490-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Attaching N_PPS to a PTY registers a PPS source even though PTYs do not
report DCD changes. An unprivileged user can exhaust the PPS source IDs
this way, causing registration of a real PPS source to fail with
-EBUSY.

Reject N_PPS on PTYs before allocating a source.

Fixes: a0880df0ccde ("pps: serial clients support")
Suggested-by: Rodolfo Giometti <giometti@enneenne.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v3:
- Add Rodolfo Giometti's Acked-by.

v2: https://lore.kernel.org/r/20261111132709.5959-1-dennylin0707@gmail.com
v1: https://lore.kernel.org/r/20261107211753.75932-1-dennylin0707@gmail.com

 drivers/pps/clients/pps-ldisc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pps/clients/pps-ldisc.c b/drivers/pps/clients/pps-ldisc.c
index fa5660f3c4b7..83f4caced0c9 100644
--- a/drivers/pps/clients/pps-ldisc.c
+++ b/drivers/pps/clients/pps-ldisc.c
@@ -46,6 +46,9 @@ static int pps_tty_open(struct tty_struct *tty)
 	struct pps_device *pps;
 	int ret;
 
+	if (drv->type == TTY_DRIVER_TYPE_PTY)
+		return -EINVAL;
+
 	info.owner = THIS_MODULE;
 	info.dev = NULL;
 	snprintf(info.name, PPS_MAX_NAME_LEN, "%s%d", drv->driver_name, index);
-- 
2.50.1 (Apple Git-155)

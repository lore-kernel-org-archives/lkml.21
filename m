Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082794;
	b=AaY6ckfbwtwG/91xIgFO1Odz9oUBL4ibZqHP5Yg60JyQKG6IN+cZ1LqNlGilyMdbqOqB
	 Cm/KyOhK1+cmo8mU7t5/32dV21BnG2XxS8wWhiojipdcxR0r7ER7SGDzUB4Ya+1weo4M+
	 5G9yITu2jxZLcc0TVuk1g6llXMEpUq/KUa/6Mc+N1TE2FSaod9hl8f1u53oI+t7N1Wdmc
	 ZcSPW0tOewEIpK4y6chRh3Voet3BtfL935xNCQ+nz8unwcf/ezSl/fJqMxT+4lp9Xb6Lx
	 b/yUy0vb7H2TQSumL7qOLTxIjYoueP2dylxP/IpJKPZGDkdoO4aTVsci/N1bX6rJKWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082794;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vPawRdxVx5IJAwWhAnzzAdQ6Dv3hvzTT0c4JiuMk9f8=;
	b=UriMCBit7zdts+TV/+MssvSAAjTZ3ulcwcOAGGgoGD8z8Gag9agGxHSsb+2ipMlhebQI
	 1DOPTCRMaKj5ZBt2eh0Zm4XEWAJaTF3Ki98aMD+z2NCY33RenC2cBhYihXSoBEreNwFGn
	 45UyQfo6bimQU8qpWwlTQl1bMD+yvg1bdkjdaahfrfoX94OUfgzcwNxAXLE2iw3jM8mU7
	 uof7CRrCyNUnY5MkBEOh4STLuEIduCdDnYRxvn3ipLLoJAGMf9ROByAO+ANj1Ubs/GO8l
	 vPm/wete5eehFBTWZpeOoYCfdihqohfBkvjeR3r17v4abh4VdPbAod8s75NqERygXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=7xz.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C400606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C400606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=7xz.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so5618010eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082793; x=1795687593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPawRdxVx5IJAwWhAnzzAdQ6Dv3hvzTT0c4JiuMk9f8=;
        b=dmIN7NNtzgUtrgtnO4m72OnB56GgVTT+4ZbPQTGnt6ohN3howsYe9dnLOdOh7xNUeR
         2hXutjDYxoKGs/hzHpuciZ13I7ozlJIIbRs5kOxH+IZBgzJg8W/qw2L3ZBuFjkC0NCHf
         9Gow16jOGPBWYnoTbVmKVTpujKcCPVCa7t/jFYR3YTdkBQwFEzYupkae9Dm/w4llGiZL
         eYd/yrfTG3yffyOeAReFX7AktYVGv+NaeOFklV5gL+jE0cG/0hNKX1kwtpT0KKq3EcVI
         U+JRN01Q9S5/AbG9x5ZvnrNqEuigs4tN9h9o4Wm3RVRVonYmPtZ/3GutYVe2jeYtvP4D
         sdCw==
X-Forwarded-Encrypted: i=1; AL+hErFHIEMCR/lpBaWcw24rP7ZoogkvdH+JkSBjCHVntJUjfxDL1CjbeYJDh9sYwwrjNTb+ridymeuMBIFPYRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+31yAtaDQ9UyFpOvJSHN9/5W+k5Nk6/iskAZDFz/b4FILUAQDS
	LoBJ1RgvYv2ylJniEEsw2XehpJzXhSJtFuf4/u/87NdwtmXeeh3g93XF
X-Gm-Gg: AZFdTZf5U3ZvaNouwU+Jw10Rb12bbzBYCxBPRpTAITx3bDf8xSBX9g+hvA2lJv1kJ7s
	nk6w8qNcpKdRVlYUX0qXmisBkkk25k0fF72N8+9+cpPCMWVhjY/Z2dxyUH1h8ESO2qyYpne+p2D
	0wXbSyvP7zm3RQuUWzMnS119IEBVJqs2oyIEBhJCS7U5RCqby3EwS9QgVXVkn+JqdrO8ht23avp
	E/dru3cWiRejZtOj31BPBUGh3n2+c+Pf5rIl4YeBXMRd7/AOADybJ1GoHmQn47tZGXHimk2Un5g
	o0qG6rxA7P+0eqeI12oce7EUH3pPaSVambSdlv9GGm+wP41WpMXrlIQDmt4FsJKBOMUSrByAWgb
	zw2B/0gGSCechNrj54ib0ykx8zWQMwbH0TLVs7yzbLGUaHTABPGiAN5zPE7Mq+mwcm8tEoh7ISg
	Ppccaeq43PZA8gwPU8gGzcbOgXA5toU8AXxAa0La/gSDJQg92IsAEdCjiAS9mBsLYAlmsAO8ODn
	3N7hPHALaY7V8IvFQ2ZDRkmLAiQ/rCTbl/lHicxJBdmkK9PFmQg+oBHfINpQ0n6QzYjbFjGAuyd
	T5wubbMiCy2UUrH3A55nuIqjk5hcx9X+WqKznHX8aZtj7A==
X-Received: by 2002:a05:7300:7314:b0:381:c532:3d88 with SMTP id 5a478bee46e88-38280c2fdbcmr7294986eec.23.1795082793390;
        Thu, 19 Nov 2026 02:06:33 -0800 (PST)
Received: from DESKTOP-SA7O5VQ.tail87cff0.ts.net ([211.202.142.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3848dc19705sm4083104eec.23.2026.11.19.02.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:06:32 -0800 (PST)
From: Sihyeon Park <me@7xz.dev>
To: sam@mendozajonas.com,
	fercerpav@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	delphine_cc_chiu@wiwynn.com,
	Sihyeon Park <me@7xz.dev>
Subject: [PATCH net] net/ncsi: fix channel loop termination when Channel Count is 0
Date: Thu, 19 Nov 2026 19:06:25 +0900
Message-ID: <20261119100625.72505-1-me@7xz.dev>
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

ncsi_probe_channel() and ncsi_suspend_channel() (state
ncsi_dev_state_suspend_gls) walk the channels of a package by
incrementing ndp->channel_probe_id and stop only when it becomes equal to
ndp->channel_count. channel_count is copied unchecked from the Channel
Count field of the Get Capabilities response in ncsi_rsp_handler_gc().

If a Network Controller reports Channel Count 0, channel_probe_id is
already 1 when it is first compared in the suspend_gls state, so the
equality never holds. The driver then keeps sending Get Link Status to
channel IDs 0, 1, 2, ... and never reaches Disable Channel Network Tx /
Disable Channel, so the reconfiguration started by a single link-down
AEN never completes and NC-SI does not recover when the link comes back.
If the link flaps (down/up/down) inside that window, the driver
additionally logs

  Invalid state 0x3 on 0:0
  NCSI: Handler for AEN type 0x0 returned -22
  Wrong NCSI state 0x100 in workqueue

and channel monitoring stays stopped.

DSP0222 defines Channel Count as the number of channels supported by the
controller, so a conforming controller reports at least 1; this is a
robustness fix for non-conforming controllers, firmware bugs and
emulators. One such emulator is libslirp's NC-SI responder (used by QEMU
user networking for the Aspeed BMC machines), whose Get Capabilities
response leaves Channel Count at 0.

The probe loop uses the same comparison. In the tests below it did not
hang, because the Get Capabilities response was processed before the
check that follows the GC command, so 0 == 0 held and probing moved on to
Deselect Package. Whether it can hang depends on that ordering; no hang
was observed in the probe path.

Use ">=" instead of "==" in both termination checks so that neither loop
can run past the reported channel count. The suspend path change fixes
the observed hang; the probe path change keeps the two loops consistent
and removes the ordering dependency.

Channel Count is not validated in ncsi_rsp_handler_gc() instead, because
rejecting or clamping a count of 0 would mean deciding what that value
should mean for a non-conforming controller. Fixing the loop bounds
handles any reported value where it is used and does not change
behaviour for conforming controllers.

Tested on QEMU 11.1.3 romulus-bmc (aspeed_g5_defconfig, net tree at
e203d8a4751d) with a minimal initramfs and a loopback NC-SI controller
emulator (1 package, 1 channel) reporting Channel Count 0 or 1. Events:
(A) link-down AEN, link-up 15 s later; (B) down, up, down 0.5 s apart,
link-up 15 s later. Result measured 180 s after the final link-up:

  kernel     count  event  after the event               ch0 GLS/60 s
  unpatched  0      A      GLS to ch 0,1,2,..., no DCNT/DC   1
  unpatched  0      B      GLS stops, monitor stopped        0
  unpatched  1      A, B   DCNT, DC, DP, ..., EC, AE        58
  patched    0      A, B   DCNT, DC, DP, ..., EC, AE        58
  patched    1      A, B   DCNT, DC, DP, ..., EC, AE        58

(GLS: Get Link Status, DCNT: Disable Channel Network Tx, DC: Disable
Channel, DP: Deselect Package, EC: Enable Channel, AE: AEN Enable)

With the patch, Channel Count 0 behaves exactly like Channel Count 1
(same command counts); Channel Count 1 is unchanged.

An AI coding assistant (Claude Code) was used to analyze the problem,
reproduce it in QEMU and draft this patch; I reviewed the change and
the test results.

Fixes: e85e271dec02 ("net/ncsi: Fix the multi thread manner of NCSI driver")
Signed-off-by: Sihyeon Park <me@7xz.dev>
---
 net/ncsi/ncsi-manage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958c4429..c5cf2ca0385c 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -520,7 +520,7 @@ static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		ndp->channel_probe_id++;
 
-		if (ndp->channel_probe_id == ndp->channel_count) {
+		if (ndp->channel_probe_id >= ndp->channel_count) {
 			ndp->channel_probe_id = 0;
 			nd->state = ncsi_dev_state_suspend_dcnt;
 		}
@@ -1491,7 +1491,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 			ndp->channel_probe_id++;
 		}
 
-		if (ndp->channel_probe_id == ndp->channel_count) {
+		if (ndp->channel_probe_id >= ndp->channel_count) {
 			ndp->channel_probe_id = 0;
 			nd->state = ncsi_dev_state_probe_dp;
 		}
-- 
2.56.1


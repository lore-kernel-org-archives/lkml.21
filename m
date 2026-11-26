Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663207;
	b=cB/W+pqkm01GOZOcSfAjpy9z+1SJpZ7afsYqycNYyFyZYO+xRXlra8QYPE3RXz/oF7sX
	 0K4V0nrVXChVwWXBdVbu+O2Joc5ZLUFjAXKTJHFEMQmi7LbdWERwLICEHDbVv8sDarKsI
	 fHxa7Ke7yxwfgXKM0FzyLDkaWQTPun12qFhHeaDZj87TOu9d00Iw99BVdgG43rhdtgYJE
	 xN2rCBKy8PGdcrR6bLkQmMpmg/vKa/Nep/zdXIEQJOWyoCw5cOFrNRi+YhcBbmDEFgy4T
	 QzHIehHFZq0+E9iP3MNEOdZ4IIkwT/xNI/6dFTc0YqZxzJvxo5WKuP7rPPfG7AkJwtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ddFS5afo7Q+Q+cm9cTOpxmimaZ1i0Ia2B8XMfOPwFsk=;
	b=4FCxqRLNjSKOQswrlyBZP5Glg0LjU9N16IXh+WiMV/fIQt8yN+UKMx4XtTj9Fuxw2pXH
	 UNVOwIfbeKxBnhzi4cd8qabjZvD81R1wFQSDhEqvpMRP4KZv7x4Yegq5FxoCO3gl/JoRW
	 eWSD+X2prM1ohk0p63ghXkL+6zxB0+nm5J5qULCRxn8tQlGy0APmlfoUuX3saUAxX5ps8
	 FwLWKmGJs3wSakLfThIqKgjIKnomlWKC7boGe8DXuKyaoAknle6Kvw/Z9VcPSIhBo+Bux
	 jUw9Ihj/lvXuGGJRcmO1XAT1uq/wY95VjUjh+GqLUmFV0IqFuzr4M3Mpi0/pm8f7Zig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYYmRu3R;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F44606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F44606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYYmRu3R
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so66355575e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795663206; x=1796268006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ddFS5afo7Q+Q+cm9cTOpxmimaZ1i0Ia2B8XMfOPwFsk=;
        b=uYYmRu3RhA3xo+mDjNGMggA9qvI09pOAtqRznikY1fR3QNyRR/SIXN7iOiy25TWzA5
         +UEjXMFT2DAe1FE+FP6mIOSqNiaZR17HTY4bdFbSZoE1O4fJVBJvURqitjOBy9Zbp9Wu
         r9GKDsTS2Pz2GflqdncYNSt+l0cYyuPu/Z3BMFJQXJQT84oGBH3DFJ6RPLHN9iU80VJk
         Llbmd1oJjGg3cu6VwLujHaWLEKd+3ntGwLCOcMGpp0vK57rs3BNevkOr33dg9mQVd3Uk
         Vsa0tL2QlVfib2qSgcU2rFhkrX+lSEhv11J9kNKXVmtaKn559kw8oaG8g4YY0B9KDduX
         jg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663206; x=1796268006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddFS5afo7Q+Q+cm9cTOpxmimaZ1i0Ia2B8XMfOPwFsk=;
        b=ifHfDxvQxxcfiXZIByOH577a9wy3KG+TjzFcS+bcCbEu/R9d2nC//QQWQ81fMYW4q2
         kgw0ly1C4q4uEUyR/LM30mt7xSGjaWsC2NBwQrr2sYalM2t2iEwG35qFqd7zp9iLLj9j
         IQYPsIuSlSjncZnAYo8DGux3LqYUNd5WzSdcJnvilGvV9i2Ewrhxdi1PBMkEkSYpcbO+
         XbaLcf3m22u6rwhCe0LtiZE3gvPshxfaRcCFyhqqWLSJCbCMxicNMqj1WPf1tGJeyk/R
         QQjJVFCBBRm6zs0UlP7w4YupwzdDL4uPIH5Z9OOD/AfxFckOKtEJKZbo+yVDTuDOT+NG
         Cp2g==
X-Forwarded-Encrypted: i=1; AL+hErFm9h194OeCQF3oyjJ9baIzqygpjYtxvGsPs0xZQIEXmICF4PyyidVRDr1WNuksj52/FXhYSDqUqSmb4JU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nWIHKESicXLboUGMnD/ZXY80rXv6XaG8bzUk6XsfdcHmw/Lgm
	fArBhoa5z0340Stwv70Xu5q4NsXLEUHrarFMxIsAnzA7vIkz8aOpoM5hMOEeFOIl4DI=
X-Gm-Gg: AZFdTZeJmm4KKBVKCY9js9IrAZcmS6tVNPwDIb2JpFb8fH5MkwW1f0CxWBKYLm2Vclk
	Nj3ksaHVjrt3v3glpDxV9Nx70fNoPLKjGt67p0xk/1JhVHuf+CqCxohykn3hba33lPPM1gaciIY
	BdKsMWppdUelr5dfFPlT7UaLHhUy4ipTj4a65RuDXkSXtQPWekwkXGnSEuvBbmRK0MKSgm4E2f6
	2MR3K3893tZqtQ3n33ZYHt2HLuCItiKttr5eBS0EPXJpRdtANaFUnpcuveChjUs3IJrqb0742R9
	eAU52Y2r7DmCEwF4M2h68Fgr12+tQL1ZlN6749drcvUNwcQSebEzqKCWLq0I9LIBwHdxo28QXlF
	bF7UEe2z0f9rGP9p8vpSmWwvyoXvw4IHOXWZMxNKQzeXPcHLH1KHcQ29uArE7goCroQCLZcEWvR
	4RMXOCWCH+5GQQOmraG5B9JtJjCisdej4cTbbBbi0eBeO1ehqIxC5npe0KOI9TMY76k0k+fC0mB
	zU9wz3kwh1A68GHA+Oswt0EMzJ4fYHVa8yRhTOghYw+tbXIvh6eU5K9mHPwBSKF1Hs4OxpBoXLw
	rbe3in1JIMOUh000e3nYkbg+3vvusxntk3UhwuixSJRtNnm1fs6jntmLsU1DtX5793/8Jhuc9+R
	RChSsXG55sptv99pM+ezeGWsmCVKlCCAsN/u0f+KZrYuT+0dI2Ln+l301hfZvSxKmSgxYoya2cS
	tWF76h/+Q+u581CWuzaEDBh3Sy2M5++Cfirg==
X-Received: by 2002:a05:600c:a085:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb8881092bmr401946965e9.13.1795663205742;
        Wed, 25 Nov 2026 19:20:05 -0800 (PST)
Received: from localhost.localdomain ([31.223.101.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm537902925e9.8.2026.11.25.19.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:20:05 -0800 (PST)
From: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
To: Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Cc: ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ntb: ntb_tool: fix use-after-free of memory window debugfs files on remove
Date: Thu, 26 Nov 2026 06:19:54 +0300
Message-Id: <20261126031954.168544-1-kaynak.oguzhan0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

tool_remove() removes the device's whole debugfs directory with
debugfs_remove_recursive() before tool_clear_mws() frees the memory
windows. The per-window files peer<N>/mw<M> and peer<N>/peer_mw<M> are
created in that directory, so they are already gone when
tool_free_mw() and tool_free_peer_mw() pass their stored dentries to
debugfs_remove() again. Those dentries have been killed (d_inode is
NULL) and are freed after an RCU grace period.

Removing ntb_tool, or unbinding it from the device, while a memory
window is set up therefore crashes. With lockdep on x86-64:

  BUG: kernel NULL pointer dereference, address: 0000000000000140
  ...
  Call Trace:
   down_write_nested
   __simple_recursive_removal
   debugfs_remove
   tool_free_peer_mw [ntb_tool]
   tool_clear_mws [ntb_tool]
   tool_remove [ntb_tool]
   ntb_remove [ntb]

(0x140 is offsetof(struct inode, i_rwsem) + offsetof(struct
rw_semaphore, dep_map) read through the NULL d_inode.) With KASAN the
same access is reported as "null-ptr-deref in range
[0x0000000000000140-0x0000000000000147]". If an RCU grace period has
passed by then, the dentries themselves are already freed.

Found and tested on a virtual NTB device in QEMU: removing ntb_tool
with an inbound window, an outbound window, or both set up crashed every
time (tool_free_mw() or tool_free_peer_mw() in the trace); with this
patch it unloads cleanly on lockdep and KASAN kernels.

Forget the window files once the directory has been removed, so that the
free functions only release the windows themselves. Removing debugfs
first is kept: it ends all user space access to the files before the
windows go away.

Fixes: 7f46c8b3a552 ("NTB: ntb_tool: Add full multi-port NTB API support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
---
 drivers/ntb/test/ntb_tool.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

--- a/drivers/ntb/test/ntb_tool.c
+++ b/drivers/ntb/test/ntb_tool.c
@@ -1599,7 +1599,22 @@ static void tool_setup_dbgfs(struct tool
 
 static void tool_clear_dbgfs(struct tool_ctx *tc)
 {
+	int pidx, widx;
+
 	debugfs_remove_recursive(tc->dbgfs_dir);
+	tc->dbgfs_dir = NULL;
+
+	/*
+	 * The memory window files lived in tc->dbgfs_dir and are gone now.
+	 * Forget their dentries so that tool_clear_mws() doesn't remove
+	 * them a second time.
+	 */
+	for (widx = 0; widx < tc->outmw_cnt; widx++)
+		tc->outmws[widx].dbgfs_file = NULL;
+
+	for (pidx = 0; pidx < tc->peer_cnt; pidx++)
+		for (widx = 0; widx < tc->peers[pidx].inmw_cnt; widx++)
+			tc->peers[pidx].inmws[widx].dbgfs_file = NULL;
 }
 
 static int tool_probe(struct ntb_client *self, struct ntb_dev *ntb)
-- 
2.34.1

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187797;
	b=J90QHeMt6av4+0ZrqNZrEffTcADWNG6AZ247NETdtqgtAnC00u2uOpJadmPNzBt1n/QU
	 ObT3mELUopg35a/Xn2zaAVER+qhnqOXFMznUVwyeKbH0xUB325IjUWoeIB1usawcLRYsH
	 2FlsH4nmJ81fXZHzLBfEtddFEnGjC4A7aCsooszuijLCBAtI93z34XZQ+pMxTGJu4eKkc
	 OcCBOIelYz/ZrJYk3PQ60dI+ljkfRHgMD/geJQGRm4DFDo0n8M2aGoET816rnJ7u/foHZ
	 6OXQBIWcmm+ENCfIjJ8izPCxhIizDPvOXNnjeCyInFnHMclS4xapOHUO7B9oHu05iqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
	b=3f29hf4yCYd+4RHZYKKAZ19Q6jan5+b8MIsCXbm9OkNo/LRG9HtPEuYakRaO6gM5VZQK
	 jxG0pG4dCz7VhlU8DMXomzKkwA4I5LzwyhfvyC7W2IKZP3RiAJMQAt122ekfQ6sgkKGbs
	 cYzzdIrPU4p/9Z1PlGUmjtcpBOwO0+nZ4f1W6fOcr3GNaXDQxKJIaDq0ueVLEYsZnHBsB
	 9zMkosKDwUNG0P02Eb2VwSYzyXEBbCdWQdYc3DSLqbiZnjMFhsuOz1xXWpF0jjQk9Z2e+
	 +FhSIjJz8ESQXjEtp1M0Grds8mf2R9KU5FrMbZ5uSio9b+J02dMK1GVJNOZrR+2qlSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ZBHWfN5E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB93606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB93606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ZBHWfN5E
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5430f70c827so14659831cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187795; cv=none;
        d=google.com; s=arc-20260327;
        b=q0cxzyayrSSfkP62DjPKeu7zMoUpGi3aUj3srJf7DFOGtS5o0qLUuXVcHMC0SQiHuW
         ipml3kVMBHCca+xuXOp6hRa0JyVTwHFmzsNo1K7Lv/Ud17EQQ35HwNhKXlMbC2EBtggI
         jWaXReUPQBhyePThaGkGXfIwhrozb9bQeCquu82SqiWvlACn/tpYW/AjAZprFhnaAbXy
         NIXIILPqxLfRFWyaWO12Zrv8pViThVEl5bdDSECaiksdEFzHv4xwq1xQL2wri42oqLkx
         bQSqjaoUrMyzb8ucba+NoEWu46vnMuTjq2ApzBVLfXZZ/ZvXZN1f8GgjOKG2EKcsJE4D
         cU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
        fh=qvCy5mQ0yf+eqmSJniwbsnmFxpBJeIo8WXAVhYfdPXE=;
        b=LonRGSuJsMbQGWAEosCc8EPR6q0SIFDv4n+tG9Kz95KtW5kZ5lGhSgQ4387iLfHpIY
         d346zkGy3fbkvKdePJR7qL0T3iwc9u4xNXgYtqBGNqYDu8tWdpmiYU4HMnaSG3FlTnnz
         q9JzOTTfgg5gf2IjGocpLdxnLBFNgafTGGNSC4fUlE7ttyU++qRf2wFTAIMq9EeX9qrB
         QJOxc6g4qrd6ihymmYDW9LhsySy4g72QMwyi0FQD4frtyItIA9AZoU0ErleVJAK+uDxx
         0TKiGa5K7kZSBPZOACgF9aKsTTwW0TgGXi0x8Pt43NFJ0Rr5tTiXVefnOe+U+VtLG532
         6RrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795187795; x=1795792595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
        b=ZBHWfN5EBCTvJBzOSDNLhl8eRWHIOM284uWYA8Ud8wrinUzLD4l5aq9iqi20zYkWtz
         mMdrRLjigEmz7PzpVuGpsZG73cBsgL+xRb6/byUz3sJ1eGQogIIhgBnhWMCexJViCWYS
         vhAoChPkUMu15nwp12Au89CeK66CwRUcg2W1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187795; x=1795792595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yW1EW3ndjX19ZMwxi5BjIBlhtxHPAFUThq+STsbmeB4=;
        b=fFd5My0e8SIrqr9yM0Br6v7WqIc5fXdsiaj48rz0adfAGtpip8BN9oO7cKEIeUiuHc
         Eo196wkdOK8RLh6ouXJ1kcSKTZ8G0lhs/nz4E7NY9pzhN1By7o8k4szZ9YzhMMbuBOO5
         wejTOshqAIbmXP4bjiCxf4CABloJ9aD92QdQBJ8dwCeVpZ5euQP6EdaLdSC7tWPdvgi0
         cS1O94UfgQ/dN41PRbMzFYqX8IztbMbTucAbcgU1ODXFS4HFKJiW9LUuztZq6pMGvMc2
         reui/IZ3GiLUbBIBo52i4f2WJ30S1YbBvPJMY7P+QWerPLXkbpNb2LUTxRo/BTdk87jY
         A1/g==
X-Forwarded-Encrypted: i=1; AL+hErHCoZneloul7Kzlv5/lUokrrhqLORO4K49vz6dlVyZQLlWohacvw1irCyuEu3wOdphBECNZjn1BJ2Pm7xY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9je/5c8vXgBkyV5wNo/+7KgN7oecgxIDaJOdAnYv3syY1aV/AX
	UqCJXZhwk0M1L21aJWR+2BdV4w0/KkplvMB3aKMitGUwMLofneCGG3zK/5b6SaLICazh1f9lyqq
	V0ymgnAWF1Sfqzz4tRwFCgZhu5wa9VkozOHwoQM8jVg==
X-Gm-Gg: AZFdTZcuExZYJBtiMWNDqAbpNBDGwMjdTkd8jiIJbK29nkJaaHz4pfeQXQbD+h+UkuC
	+lcYx1wcrQbPfhmrOPCb46Uz/aI+b+mWHNBCT6rf99o8SbhNSnx8OWsmmjwEVkDG0IoTw/oO6AN
	XByczR2TZHlWqq5UXvfjGK5Mz/LN+bAc3GPScwNKPeON9WEKO0Uqe/JtiAmXgf0D5whOBRBhPbO
	RvbVCOMGswxjKJKVkOvmg09QlkKwSIYKmFs9y6ywcNPRGUFR1POKEwGHaBiBLgq1zAV5+u1TFKz
	3R4XlA2aomJDedHhpEBz36XX+JLhf2xrxtTpcpURAvU5HcfnXoW5Wz7zitmfQ8IQ0+sIEy9W4Un
	/3oUdHZx3D+hwkhI0L17bt2JBWlXsOSeZaNlRcLpyQcW8E2S+YSJL75lXM326PQzKGw==
X-Received: by 2002:ac8:5706:0:b0:536:3760:e6cb with SMTP id
 d75a77b69052e-55d769e9387mr59850611cf.14.1795187794951; Fri, 20 Nov 2026
 07:16:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 20 Nov 2026 16:16:23 +0100
X-Gm-Features: AclHuK9Kz6D2bchO88XWWEcVzCFfoEy0keHk3Nyv8Ec-0oQZb2LLMT7EFrmIXNc
Message-ID: <CAJfpegvzVm6hTTNp7BgkFMs1DziFvmNoHUXjdTPz=9nC5ccUjQ@mail.gmail.com>
Subject: [GIT PULL] fuse fixes for 7.4-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
tags/fuse-fixes-7.4-rc4

- Fix  bugs reported by Sashiko

- Fix a couple of issues introduced in this cycle

- Misc bug fixes

Thanks,
Miklos

---
Hengyu Liang (1):
      fuse: preserve ENOTCONN after failed initialization and disconnect

Hungyu Lin (1):
      fuse: clear the old EOF tail before writeback-cache writes

Junyoung Jang (1):
      fuse: skip dcache instantiation for readdirplus names with embedded N=
UL

Leon Ming (1):
      fuse: set dentry epoch before making the dentry visible

Miklos Szeredi (10):
      fuse: fix possible UAF in fuse_direntplus_link()
      fuse: zero the partial EOF page in copy_file_range()
      selftests/fuse: test post-EOF page zeroing on copy_file_range()
      fuse: derive short read EOF from the request offset
      virtiofs: fix use-after-free of fs->tag on device removal
      virtiofs: disable request timeout
      virtiofs: zero the reply region of the argument buffer
      fuse: don't mark inode DAX without CONFIG_FS_DAX
      fuse: advertise support for DAX mappings
      fuse: limit name size in listxattr

NeilBrown (1):
      fuse: Use d_alloc_trylock() in fuse_direntplus_link()

Orkun Emin Sar=C4=B1 (1):
      fuse: don't pass a NULL inode to fuse_inode_backing() on release

Shunbo Shi (1):
      fuse: fix UBSAN warning in fuse_iomap_writeback_range()

---
 fs/fuse/dev.c                                      |   8 ++
 fs/fuse/dir.c                                      |  12 +-
 fs/fuse/file.c                                     |  53 ++++++--
 fs/fuse/fuse_dev_i.h                               |   3 +
 fs/fuse/fuse_i.h                                   |  23 ++++
 fs/fuse/inode.c                                    |  46 +++++--
 fs/fuse/readdir.c                                  |  39 +++---
 fs/fuse/req.c                                      |  15 +--
 fs/fuse/virtio_fs.c                                |  34 ++++-
 fs/fuse/xattr.c                                    |   2 +-
 include/uapi/linux/fuse.h                          |  10 +-
 .../filesystems/fuse/write_extend_eof_test.c       | 143 +++++++++++++++++=
+---
 12 files changed, 308 insertions(+), 80 deletions(-)

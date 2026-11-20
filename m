Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133314;
	b=EqCUYdAN6x8to/UvgtoSLJc1cIMePBGlSprKlFLtK5c31sGq6J1SbKYOrVPdNOl4yatf
	 QKt8dSBKhorWDKJZSNytjJTj5Izb0x9vXIDdZHlfO0+5xtL3y7cU94f0yyoGtBYY+Ghwc
	 /zce6w4kgjzofcbEVOP3MNbjWXd37L8i7EGaudSE29Dw7GPexZlhUiLX7Lzzti/Kujlpw
	 /eZ6ZD97pgD+my5BK/KHo1XX3HIuvydXfn+SayaEidcNcKq6QzoOaCwFXmZGgGDAMzCwh
	 MF4tAXK6blevqKUKjQjSgpMGTeBpe9w/Ym873nm0SuIY5hCfrnwmzNGadzQjaJXrD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kfpfHmsXunUBWQlKkF97XoBgLUmLhk3tSJt0eKigJrw=;
	b=em9yf17wmjl6YzP5vXWNgryqN6PxndX0Fjfh3UJaMRA5A4B3O14b86sZjLZA1In6Zail
	 VgQD0bS0FV8ccWFE29H2FyduDPC6uOtpLpyWeL2YSD4szEkNgeU2MmhR/U1aZ/qEWSjQG
	 7G9lDd8hHM5Wbc3UkxHhnQ6bj3iiLSgkgX29eIRo85QrikpYU2OA2hnVW1nMiPWLd3wkh
	 iP4CIL+cZk8Vn2DCqfUyElsz5xfnDL1Q97Po23g1WyxljFeHfuKi5SvF+L/qOwQt6Dn9w
	 u+UmvV9ofB8f4q/nDtxu/xiJjRQ9g/wR5ZPnEYNVGlZZgTWDL5IdEoIvWx4OILPAkwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svKQ7KF7;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2324606A761
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2324606A761
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svKQ7KF7
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-92130d3ee15so4463546d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795133312; x=1795738112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfpfHmsXunUBWQlKkF97XoBgLUmLhk3tSJt0eKigJrw=;
        b=svKQ7KF78TJhmDtwiUwNaWzI3exRBzt25b3xVqSTz4YuqP/MvP+Ko7xROPLffJCFyd
         bjjBRzeS3l8YH1QPTT28QNA4doLppjLR7gOLl5RymhvG16KGh+57wmVNI9IVKG5mwDLG
         84zYZPyYQ5/ViVj2Nl1MV09RzzV5PjTXrnThmdK9LLV2JTdpxU4vmZZ9akWQMzhXpxL2
         3PJZCbzFHxO+kO8qVC9jjEyejrCXBZpDqqy0KJYQe8nxPj7h8Cfci/EuIbUf4hgHLtyJ
         IDLkhPUpcib8OcCZnjIClQHI1RGllMRLD9R/e6l6KG00uyQ8ZcKttDywgUpF2ksnW2NL
         fKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133312; x=1795738112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfpfHmsXunUBWQlKkF97XoBgLUmLhk3tSJt0eKigJrw=;
        b=ezL7rjNzR7MfoN03xTTY2mRrHupdUl/Ek+qmlRYwB035jJU8Vwo6Hf2OlSFDNhSL5A
         8bAJh5uCvxWU8fu7+Z0n7m2496iomIh2uPBkwtwFgJqZ2XOhgFAk09tPb67EvElPMFmD
         vH1Cn30ntloduxQvmALOW/b5BxlXPJYagCYXQsYkJf5NDvbPqeOuM2srsf3WiaBMVo87
         ScLt/EbEhtFoCIszKptQG7tXWPIaP3Ty0kWyt/nYu6/CKffpDg050Uns5g+3/LF/3hjT
         0hNuLmVPa9MRWHaVQfaFk5q6L4mmo+8CCY2F5P7tbavCe1M/2LcMZr6mNznu7CkqRDGV
         HrYw==
X-Forwarded-Encrypted: i=1; AL+hErESWjWWEntuFPn9zKjH/SaxRTZXvAdZzu0ZiKKY0qNEWQpciVzLCrBJLH2GBBBtD12bGQ4ynUHEWBVVtrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bseLLAtICPXJFSzGJhovp2s4NcEcMrku/TKDmPN6ZzHtUMvSj
	m2pIsdF3pKySCWT2WPAhNNQd5DsN2fGbhQil/ER8R+O4jQ6JerwFHJSsqWLXLzirMAs=
X-Gm-Gg: AZFdTZdbsGkB7u1BQaGNTU13w3/BqyG1NuDacfFeOeIKyaEXm5hpO2SKKJ/f00ClBAL
	VRwH3tFW56WXCCRwZRKa4Zu03JgIsdtKMTKuDEo3J/wgcfRmj+qQTXJz1vrmWdEMZ2wvkwdercb
	kc0PhiWpEH/kwo3b7la/blk94wnHwXD33s/d/Gpy44w3B8zZrknWEo0QnnwCF9zb0wosylURkiZ
	YtQ3acAwZw/MqOKxObV9rDkQrlDIFpMcFmGq+TqbJp0ZC1nMDLt/LkotsWOpZBuEYPsrvsczAjs
	BsMIBAQ4e9u4a4oxOzTTmisCGKRuVH2q/XG1Eie8y8x+Yl8F4AfY0xIziGsWD4gad9BhGhV+BpF
	uPYMrTn8ZPOXq2KVOC8JfuUnVvEDIttxOEphK0qTP74w9jICIxq2u+QowYZ7EgpQU3/O8fTAO4m
	YFF1BeW45dr56es6NacYJSOSeir/5nNQk0ISQSwKi1MJy1QXO3ki9TR2aB9XBjlOPUnqbDWTIdX
	bHVdZIxrNqRUHgPy+x39TnfRWgAOzuakT1k6HRgRdsQIjswU9YDCtpjbC8BmLowtlC/ot+/uxF0
	b92URXQGqeFKGAnxiD5Hn5zq6t87jfzY6g4mhw/LZabSRbiz8eNxWeqi+VqllAAl7qOxfT/WO1s
	TNWudIRH1A9sHL29K2DIWXlJUrfnzriFcd70R4N82B4A7MVXpMurOboYqXIqCZjj/1O111eeRic
	tVXDNRODEZozKUGaCzwKpcTRjoKy4=
X-Received: by 2002:a05:6214:488d:b0:921:37a7:d1a8 with SMTP id 6a1803df08f44-92137a7d247mr6425726d6.1.1795133312417;
        Thu, 19 Nov 2026 16:08:32 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c935:f347:a919:9f78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0c33fsm10976546d6.36.2026.11.19.16.08.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 16:08:32 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Bernard Metzler <bernard.metzler@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/siw: Reject a zero length WRITE segment that announces more segments
Date: Thu, 19 Nov 2026 19:08:29 -0500
Message-ID: <20261120000829.64597-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

siw_proc_write() returns early for a zero length tagged segment, before
it looks up the sink STag. If that first segment has the L bit clear,
the next segment is handled as a continuation of the same message and
siw reads mem->stag through rx_mem, which was never set. A remote peer
on an established siw connection can trigger this, and it panics the
host:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
  RIP: 0010:siw_proc_write+0x175/0x9c0
  Call Trace:
   <IRQ>
   siw_tcp_rx_data+0x20e/0x2040
   __tcp_read_sock+0x1ab/0x810
   siw_qp_llp_data_ready+0x185/0x2e0
   tcp_data_queue+0x1f2d/0x4b70
   tcp_rcv_established+0x8a8/0x3990
   tcp_v4_do_rcv+0x45b/0x970
   tcp_v4_rcv+0x223d/0x3b90
  Kernel panic - not syncing: Fatal exception in interrupt

A zero length DDP message consists of exactly one segment (RFC 5041,
section 5.2), so terminate the connection with a tagged buffer error
when a zero length first segment announces more segments.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: 8b6a361b8c48 ("rdma/siw: receive path")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---

Tested in QEMU with KASAN on v7.4-rc3. The patch applies unchanged to
rdma for-rc. With this patch siw sends a TERMINATE and closes the
connection, a normal two segment WRITE is still placed, and rping over
siw works.
A reproducer is available on request.

 drivers/infiniband/sw/siw/siw_qp_rx.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/siw/siw_qp_rx.c b/drivers/infiniband/sw/siw/siw_qp_rx.c
index e5b641c8d694..9b7e52906764 100644
--- a/drivers/infiniband/sw/siw/siw_qp_rx.c
+++ b/drivers/infiniband/sw/siw/siw_qp_rx.c
@@ -550,8 +550,16 @@ int siw_proc_write(struct siw_qp *qp)
 	int bytes, rv;
 
 	if (srx->state == SIW_GET_DATA_START) {
-		if (!srx->fpdu_part_rem) /* zero length WRITE */
+		if (!srx->fpdu_part_rem) { /* zero length WRITE */
+			/* A zero length DDP message is a single segment. */
+			if (unlikely(frx->first_ddp_seg && frx->more_ddp_segs)) {
+				siw_init_terminate(qp, TERM_ERROR_LAYER_DDP,
+						   DDP_ETYPE_TAGGED_BUF,
+						   DDP_ECODE_T_INVALID_STAG, 0);
+				return -EINVAL;
+			}
 			return 0;
+		}
 
 		rv = siw_write_check_ntoh(srx, frx);
 		if (unlikely(rv)) {

base-commit: e7732ec135b501e87ab060d992b3b5f2ec4396c9
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136820;
	b=nAAp+ifEFfN56NPq9/+IhMctXv0T+1+F+nKGY+rc8Oc5jZULqLf8yAk1neoQQfFrFSdS
	 TXcT5jEn4fA8yi9RNI1+nhrkeTX5H7eU6fWQvh5ZtALGyYcH0eFwcm50Ie6nVj7SDj2Rk
	 jgjfXBVox1Yg1jeKoJ513DtAGF2aC5wYqjSS7kjGiiiDiUSlT8v8BBkP0ShJ+QRitBOKl
	 NvRhmS+YaZwfgNCRBvMlM0pL7yXZnS3O74woC/NtN68+JRhucX528j+UVKOJsJQ5yj5f9
	 sh9ZMK/0IlWZqJDcjHCMU7VK5xPW92WGrusX4+mDWfh3VbLft9jRY28D7Db+wTW0vNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=azpbeeR0UmmXKlAwsDU3rTomTiwLhVswnIguSA8HmN4=;
	b=SBDiIzCgin7kO3XMAUCw8jamWGigasWvlh01Y+fDuPtYcACICoN0gXzz8CHXN3v2qe5g
	 WMfBHumeSZsLoyUdi8nKn/16wv7kyhqtttjpHtn5luqOMs5EDRY4Thmkubw/3XFxLqlwd
	 AYnZmpVtVHk3N7gBc3UAEDob213LTBaatogIXfGMlgMjV8dTfvVLXeX3Pr1A02R7SXYsZ
	 3QWK0w9z1B7/tWHN9lo+otOdGaL72kSFA0j8/RwdknG0oe4RGRxj/Dx56Daup1LWhk4PZ
	 B1AWUpQRG7okZw++V3mOmlhdbj3OvdMoe7MACdQpcZyIjB34OBUvapHz/cQ/uEfEFmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=ZnsO36n3;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65A606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E65A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=ZnsO36n3
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb9f760337so855134a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1795136820; x=1795741620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=azpbeeR0UmmXKlAwsDU3rTomTiwLhVswnIguSA8HmN4=;
        b=ZnsO36n3LNnCIMoGvrj3XLaJF/Zfbfxe2zrT0PZNjqgvklf3dc5+DMx+mWCmJZGWrG
         SJxihBC4TjGl9YmW3W+t5PPFqlyZ89Y+LB5hiNJX/ROOk/oOsOuxHSSwuTInPu1jb1TE
         o/72aECZz5mQwea/Xs8hcaVci1leySDdO1B9XDmz1NmIfmrl5OM526WYjvosDoSobo45
         SPhOWYRuTez3K99yfsHME5cBNQiAzUObvcRqw3S5vjmnbkZemb8FhmeB6fz4JhfHwWYZ
         DLbH0ruCwGxgOHDTHc3/g2KYb9BP7KMcmcKrpvqdz4ZiiqXE+Qg9pUoUsDZI20V08tzt
         N92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136820; x=1795741620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azpbeeR0UmmXKlAwsDU3rTomTiwLhVswnIguSA8HmN4=;
        b=gMejKiN7Ikn2TeipfspyQeu1NtEbFUAQyXYSnOn6ICN/xFYZclOuE6gWaa9hwp5xP8
         9ejgofD8A3BwFwEU+TyN2aY95A4xVWmJ+w5St1/6kEJ3MC0a8bVhnDmKMHPM6QzVO7C6
         Hp2zvdTRMPcpP7jLJCGwpx4Rl/akR+xOsddqHVdbGx9Rg2sdKJmaPRMHgHKaEvlyA9df
         vf/LKPVxJ37bJPhLfmEf59xak82C3Y2QJwckgPsZwrOdcqtjJqkABwiypNAHirE8gOIB
         drdSXY3thD9gWRgmydEmouBy06s/1Thq6aYLyo9OeTM5F8r5hU9NDFex7QQKKQ3BtHws
         gQIQ==
X-Forwarded-Encrypted: i=1; AL+hErHOyjtSTNKl7kgqXasiSXCffgEnDewwqg5p+ITY8MMksYyYG2V2R1f70ZFJUMueie8nqJ/8pvus9loKrco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yPUTj56LQbCo8wl7BCOAIZ1q5wUjLFpU/u2GbsixIEng0ul//
	R/pBSFPPF+08O6+i6GCgK4LSZjL44gMn0ciDzzGcgg/X2hoE3B/5dojQZc8D46ueQwCwZ7MvSuE
	sTy2tL3ssARDgzjWumgWQA73Pdn/1NjDbB2fM
X-Gm-Gg: AZFdTZd9qMMU26RmSLVK3zErkB2Hnd438xkUAC6i9mXKk+hsLvntOwV8JnywihzM4su
	Did2OaUzxc7d0IXojAmYvvQh/FAL5YX6A1b7hK0pS84VQW5gnFuKgetWrCCRJQBFBUIg7Xj1g75
	HKYNGGau2/oS8NpCoWghOnvyBWhbfLIgoZf8C6ZLUsHNzxRqEl9nZCU7LM2q46Gcsd7QINg5vGH
	kXEuFNXeUgumQcJ+D3vEFZuM41Q6O+fkbb4TRwN27Guw3dGjS0Yed8AIIdRJqlVFVA0UBYeoM/K
	hbqLfD0R+Lot6UpBiYlLbBIbJYVAGU0WK1rFO/sETWWbkUqtB/X8MjyUujmqUTdCZmGQgz3pWFZ
	e+0i6OM2+ZxBkBdsA74mEap8CQeDJrkZm0/RTkJk=
X-Received: by 2002:a17:90b:5546:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b41c941f9amr621799a91.31.1795136819434;
        Thu, 19 Nov 2026 17:06:59 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc5245sm238009a91.0.2026.11.19.17.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:06:59 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id C9314340382;
	Thu, 19 Nov 2026 17:06:24 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Benjamin Coddington <bcodding@hammerspace.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Tigran Mkrtchyan <tigran.mkrtchyan@desy.de>,
	Jon Curley <jcurley@everpuredata.com>,
	Eric Badger <ebadger@everpuredata.com>,
	Shiva Lingappa <slingappa@everpuredata.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] NFS/flexfiles: Don't treat a locally aborted read as a DS failure
Date: Fri, 20 Nov 2026 01:06:24 +0000
Message-ID: <20261120010624.2154348-1-tmenninger@everpuredata.com>
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

When a flexfiles read asks for a pNFS resend, ff_layout_resend_pnfs_read()
treats the failure as a DS problem. It moves to the next mirror and sends
LAYOUTERROR, or, if no other mirror is usable, marks the layout for
return.

That is the wrong response when the client aborted the read itself.
Relevant cases which don't establish a new DS failure, and therefore no
longer drive another layout return:

    ECANCELED
        pnfs_lseg_cancel_io() cancelled the I/O because its layout
        segment was being returned or invalidated.

    EAGAIN with the current RPC attempt unsent and hdr->lseg invalid
        ff_layout_read_prepare_common() found the segment already
        invalidated and exited the task before transmission.

This was observed on 7.4-rc3 on a one-client one-DS system under
sustained direct-read I/O over pNFS/RDMA after restarting the nfs
service on the DS. Marking the layout for return cancels the reads of
the segments obtained in the meantime, which then fail the same way. The
client marked the layout for return from this path about 8,000 times a
second and reconnected transports about 300 times a second. With this
change, the layout was no longer marked for return from this path and
transports reconnected about 10 times a second.

Detect these local aborts before attempting DS failover and resend
through pNFS using the current mirror index as the starting point.
Skip the explicit LAYOUTERROR and layout-return requests in this
resend handler, leaving existing error recording unchanged.

Fixes: b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the layout is recalled or revoked")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Menninger <tmenninger@everpuredata.com>
---
 fs/nfs/flexfilelayout/flexfilelayout.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/nfs/flexfilelayout/flexfilelayout.c b/fs/nfs/flexfilelayout/flexfilelayout.c
index 5c289737366f2..31f17d79b270a 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.c
+++ b/fs/nfs/flexfilelayout/flexfilelayout.c
@@ -1313,6 +1313,16 @@ static void ff_layout_reset_write(struct nfs_pgio_header *hdr, bool retry_pnfs)
 	}
 }
 
+static bool ff_layout_read_aborted_locally(const struct nfs_pgio_header *hdr)
+{
+	const struct rpc_task *task = &hdr->task;
+
+	return task->tk_status == -ECANCELED ||
+	       (task->tk_status == -EAGAIN &&
+		!RPC_WAS_SENT(task) &&
+		!pnfs_is_valid_lseg(hdr->lseg));
+}
+
 static void ff_layout_resend_pnfs_read(struct nfs_pgio_header *hdr)
 {
 	u32 idx = hdr->pgio_mirror_idx + 1;
@@ -1320,6 +1330,15 @@ static void ff_layout_resend_pnfs_read(struct nfs_pgio_header *hdr)
 	u32 dss_id = 0;
 	struct nfs4_ff_layout_ds *mirror_ds;
 
+	/*
+	 * A local abort is no evidence against the DS, so skip DS failover
+	 * and don't request another layout return.
+	 */
+	if (ff_layout_read_aborted_locally(hdr)) {
+		pnfs_read_resend_pnfs(hdr, hdr->pgio_mirror_idx);
+		return;
+	}
+
 	mirror_ds = ff_layout_choose_any_ds_for_read(hdr->lseg, idx, &new_idx,
 						     hdr->args.offset, &dss_id);
 	if (IS_ERR(mirror_ds)) {

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0


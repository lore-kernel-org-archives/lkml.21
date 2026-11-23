Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466589;
	b=BwsFyaPuYlyYfE0pbOce3MwNcSV+/hLDlPB7iK7N5S/3cRlycpTuQ6Zkvs3srqDhSGxZ
	 D0wJF3aeFyN5V3t+wfMJqnDFwhiyFymfXY5+iTgoHH+rpCbSvVX/cHN6K9abVNJ+EPdRu
	 OTZPren3pR9TbJZDNldEwTGa9rwysGGIpIJIKQIoeNs1Qvq96fQ9syjWkOXP8GwJmte+f
	 Tw1O24ICwpP2NbZh7w50NyFlI1HsuckoC5E0LNxxV8PZgoxUS7oXKInnNirGavUp3m3gC
	 pdmTpJDw2Z0JfIw0RPKDt4jtX3nCcSIb2hNpj+JL/2gEukx6wcxMpyq1nHKROQDibJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EJRttlzq8IpBp5LFV+m7tLojBORcGwurVqY+n4rc2GY=;
	b=b+h0sA4obQBQbVNzROgFCecKdoAaercLnHiNvGsOXwHwV6VVzTkavOZhN3E/TcYDt7vx
	 YwJz7lJOtqUCBPzDCjsvmk+eYo4Bjip82VWvtm125KpXnhJlldA7RuJca2LC+jctsWl96
	 xV8lT3AzopB0EsryxAxs9y8uZn1zxSrS9J0VHpa52aBAk3GW/Zqmok9w3GNHR2SPvWlOW
	 H0Dd0bw4avM4XUqBcpcKkh9zfj90/oeo9jDf4Z5tHicRrCULOLu87aVannZ/VOHbhi4Ef
	 11atNM/z750nEXffyfR3DUVUHAn0x/WDiP8yBXfHUZrOHiDIcYdes7DBx8wqBH46n4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=WkWSDix9;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F369E606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F369E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=WkWSDix9
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so5336283c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1795466588; x=1796071388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJRttlzq8IpBp5LFV+m7tLojBORcGwurVqY+n4rc2GY=;
        b=WkWSDix9GuK6inx+cpjcLk+pY4ZD92gWMy+8XEDyLaSeb4Qy/npFjEb58pGTF9AJm7
         6HT/1tkkbQxr7+mHJC1n9+ukv0V9o2eJ3Jk5sZNuyKwxKU2Ntr0/wON0Pet1lz1TmrxA
         pVdGhY6DdlVK3gyO5Or4WdsZu1uTqvvNF5bFHy00611SteZlHIo7iBwrZ84bTCNZWUql
         O/A9gzIySBDR06kSSHCyqfA3768MKIeh1GmYV/EfUgmrIQ4bCc9MDrogqlWdRhFfZCjj
         /RZTWVMPlXpikD/9QhVxn5hZ1i4Fjx7T/w/bq9T8HgTjfJciVxcnMVQQ5tcftP3fbUW2
         FyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466588; x=1796071388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJRttlzq8IpBp5LFV+m7tLojBORcGwurVqY+n4rc2GY=;
        b=ROj2Byks6lTKE6AuU8b7OlPjQYYwczzL+Q71xrCWQtAfBHogBgARbtiBJ8po6Cudq3
         7u/n+cfOSUs9md9BEF1bokN9mC18UGHXzfOYbaooV0nfI5fymIInOE2t+kI0uLIQoAPH
         zlneKQiWsSx1cPRIjo/oEy3Xjgk4gcRFzknugXjqSdoqQ/mhKNTETlLRogoq3O47hOjd
         ndyY1CbUpIjz8NW/n5DbHBJVJIpxvnqed8PH3/nY2xnHGvcKrv+ydu9CLqe9jY7pYOdP
         nt3JzRwzqD5/jj8av2RNgQmzEiap7aQ9gSItXUktD7QLWz3WB10NLJaE8x6LVHrtzLpK
         ReZQ==
X-Forwarded-Encrypted: i=1; AL+hErGYha6O7LkXwCouBir21zIXs1b6joudlvBCSOUEFhGM+KUT1bEXv4c41jaDvkU6ZwbDKwrMLBLK87M6sA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0y+glZoKHGmnS606utyR0vnesWMP3ILyJmoUPiOEwGKOYNeN3
	NHEpXv+M2dG/V6gtKd6/0sepo+Zw0NI8SKie8kMvoQfDrlLSV1Z+XQgCNGPGayXyGA==
X-Gm-Gg: AZFdTZc5bWLTDIZzIDSy9hHZ3USwu0Eak1JMfkOMUWgRPE3E51/kdZMLPZCgGbVPAJj
	S8IVtmpW9gRLkyKODMGGooE00KE9bCAM/XSn5TUznpsJGMR3RVdQ3MK7aMbRYw5SxvL6bOt5SkK
	KBRHYakBlyKOYPwS6ZA5SrJYYgqsMfdSaVn9XZol/2m4Dl2yvmpaqRYBgmVU73Z0Q554vEdOa6h
	xU8jgxwB9YM75dg7sEZN2bi25R+Jq2wGNo0adUXImqxbVH0c8wJh2z7QWyjV7ASNm/NfcxXnWjC
	ga4qWe+T0DKg9bnEYoI1I/tK8Jh47lPBg/GP0FPiTbh7aUu00dMIMYl3b56rOTwCyxXDpjQwqtG
	McR7owHRJz7FTrkOmfy74Or81y3I39CHrGDn+JiBeqqPZ5/hwnY+Y+lYa6g6vYXJNfrhU/ylZX1
	Codk7785vcWXC9nt+KeI0WU6Wmw3eThGidDWXTbQ7lZkk72PU7khb3UqclX7o1AwALFd1fizZLO
	ftZXCDBEBD1zLbkFfwXZCwDHAhSil1Tq81oVZhmqDYwGaUXh109aP4YRpPzvJiZPGH7dj5Zxwlo
	8Cesaf20OVYCbopNWebNpEt+hP49/j714pQOsA==
X-Received: by 2002:a05:7022:b886:b0:19c:c396:37aa with SMTP id a92af1059eb24-1b5568e1d36mr11821108c88.22.1795466587986;
        Mon, 23 Nov 2026 12:43:07 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm17407732c88.4.2026.11.23.12.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:43:07 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/5] 9p: bound the zero-copy reply after a fatal signal
Date: Tue, 24 Nov 2026 05:42:55 +0900
Message-ID: <20261123204257.3055515-4-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123204257.3055515-1-lian@is.s.u-tokyo.ac.jp>
References: <20261123204257.3055515-1-lian@is.s.u-tokyo.ac.jp>
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

When a fatal signal interrupts p9_virtio_zc_request() while it waits
for the reply to a zero-copy TREAD or TREADDIR, the device can still
answer the request before the RFLUSH, and p9_client_zc_rpc() parses that
reply. p9_virtio_zc_request() has returned by then, so the reply size is
not clamped and handle_rerror() is not called. p9_check_errors() skips
the size check for zero-copy requests, so it parses the error string of
an oversized reply past the end of rc.sdata:

  BUG: KASAN: slab-out-of-bounds in p9pdu_readf+0x151e/0x1c50
  Read of size 8179 at addr ffff8880043f8009 by task zc9p/155
  Call Trace:
   p9pdu_readf+0x151e/0x1c50
   p9_check_errors+0x23d/0x510
   p9_client_zc_rpc+0x4f0/0x970
   p9_client_read_once+0x237/0x6c0

Also, p9_check_errors() parses the error string from rc.sdata, where the
device wrote only the header, so p9_errstr2errno() can print
uninitialized memory.

Fix this by accepting such a reply only when it fits within the part of
rc.sdata posted for the header, and by returning -ERESTARTSYS otherwise,
as p9_client_zc_rpc() already does when the device cancels the request.
A zero-copy TWRITE posts all of rc.sdata for the reply, so a late RWRITE
is still accepted.

This patch is assisted by Claude Opus 5.5.

Fixes: f615625a44c4 ("9p: handling Rerror without copy_from_iter_full()")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v2:
- Accept a late reply within the part of rc.sdata posted for the header,
  so the RWRITE of a completed write is not dropped.
v1: https://lore.kernel.org/all/20261109105251.2545764-3-lian@is.s.u-tokyo.ac.jp/

 net/9p/client.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/net/9p/client.c b/net/9p/client.c
index e63e8c2a853df..e21d13e274691 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -707,9 +707,17 @@ static struct p9_req_t *p9_client_zc_rpc(struct p9_client *c, int8_t type,
 		if (c->trans_mod->cancel(c, req))
 			p9_client_flush(c, req);
 
-		/* if we received the response anyway, don't signal error */
-		if (READ_ONCE(req->status) == REQ_STATUS_RCVD)
-			err = 0;
+		/* if we received the response anyway, don't signal error.
+		 * zc_request() may have returned without clamping the size
+		 * or handling RERROR/RLERROR, so only accept a response
+		 * within in_hdrlen.
+		 */
+		if (READ_ONCE(req->status) == REQ_STATUS_RCVD) {
+			/* echoes to wmb() in the callback */
+			smp_rmb();
+			if (req->rc.size <= in_hdrlen)
+				err = 0;
+		}
 	}
 recalc_sigpending:
 	if (sigpending) {
-- 
2.56.1


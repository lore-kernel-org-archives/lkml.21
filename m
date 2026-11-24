Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491465;
	b=D8bVH4LhEf+3OBGsci91Ya9F8FKMnYxG4CoF84KXcwQE9T7HGo9DsVP1QwOx9XhKp1ms
	 0R+6t7sBEUfYQPG6X98YqRNvMhFE7+iPemFVRqvkGXl9+Sv1qqIOjMJp371mVJ5P60J38
	 miXFwt2ENZvMBwGuQ1mDKiWxA/2aJ6WfkaY9K3XX2KTqIctP6om1Fxv3fef7s9L268qFS
	 Fs2Zlj599DokXaD4eiYLPBoxtd47MfWoIuSLcep037sVIz+NsKWSs3ZAAeJBSmg04BGV4
	 aEACP+WwYEEzioKdnKGB8+0z3P8ozGG+C2LDCmsna+ylu1AnDolediZ2Ya+jnaU4yuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6a+Mlas+jIYbAGVeJG8lK2DRBUGlHQIH4JtbLlp5jjw=;
	b=zjZ5zVfXx57F00jnzpr4xr8WIHqaJdGQrOt2pNfYK9q7lusxEQFefpTIccpLu1s7Ltr1
	 Lp1vgP88PdH4tLq1OiT8Vs2bmPdzyUTeIeHO9XacY0z79EsWLPT62zfeBZSRn4WbZTT/W
	 /mCIhriRYEu18G4+C+0ISnBwOnssJOYVls8Ml+zNrRsmqM9YFeZ/XeV76xSBjquE77W/B
	 wUnH/9r+6s3dcqnPmIhW9IWZbPwrflq/tfbnM1lyFbGJLv8zpDE0Qwheabvq4IPYzcQV3
	 hTtCVxlA2U21Q+TuwB2gxeuoYB96xWkQBYH+epKoVL7zpv/cFlrl5kKZdLsWp/dCEcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CoPuUNnL;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39DB606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CoPuUNnL
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so1006760eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795491464; x=1796096264; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6a+Mlas+jIYbAGVeJG8lK2DRBUGlHQIH4JtbLlp5jjw=;
        b=CoPuUNnLzcSM9SnEEida3bbuO3zxMbC6YcyV2PI5Ba6asnbu19Cemd432k+pqUmEyJ
         eekgIvP29oLzciaBXYOERVfHY2F3dwfka2YP3Q4WiNzwCDsnvFunaRq1AMd1kfdPhViI
         ut+hPUX3QSfPd6azZtW/kGO4zIjQE1Qcuvmx5HECjSkXozdPaetoc7vr9BL697s/0lho
         N4WjuiNqJrqhLKs/D4rABZLuZK+gzRKRKvIc+UZgmr9Lk+0sdrrNv2NerJG7qdSa7HIs
         9mqVeYwxXJxElUQxmGdis2ET8dCviNkcJugVlZmIcEZ2rVckeBUW3hNoD5v7353TffpQ
         c34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491464; x=1796096264;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6a+Mlas+jIYbAGVeJG8lK2DRBUGlHQIH4JtbLlp5jjw=;
        b=KhLqVLu4/IORlX1VTApGSOZ10UVNBZrQMvJX5Ta3E6wqoWZ1T22Gn+/tR0t7ve/zzA
         mgQVC6DaycAn1nBN3fSeqCW0gMOtG/AEu7a7wXRIU5LmURuzrrxtVLC/9Uo4l1Ag6fkX
         C4ULvHVHYDuy1T1HiQgH8EwPx3M1yv66PNzSRzlzpzPxOS01Tf65HhqeECmN5UmjsEKC
         thauTTwse8heS9Br+VfH9wvxM/tWzOE+d5Z88PtDHYZCzYqZWQ1wtNN3HUPqVTJj834r
         xxPBU3pYpo1NtSPALl38VDNsrmfz4n9q+eBTUQyWfVix6o4SFoXP3IbHe0KZDbhHo3f9
         /58A==
X-Forwarded-Encrypted: i=1; AL+hErEh3omDAtyhk82sd/nVALKOWW/JampVJjME+Uz2S0v/nMW3GYmBIsiQCWPWJBtMaNmd+Z9N4zjFke+H2nE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vRlMYk+CFK2tXEfvmgDcSW+vPbJTU0BY9VOcYCcwPPVSP7FtP
	IrnBj4WspC/DW6lQdRW09dM02gqfRWt2z6FxPmSG02ElEYAhMRRcKhMc2kkN/ULNmlRI7X61yX8
	2u7nprZzrZmsNSZtPesk2MA==
X-Received: from dyw26.prod.google.com ([2002:a05:7300:881a:b0:381:e4bb:7fb7])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:fd16:b0:385:8744:658f with SMTP id 5a478bee46e88-3858753a876mr13828599eec.28.1795491463448;
 Mon, 23 Nov 2026 19:37:43 -0800 (PST)
Date: Mon, 23 Nov 2026 19:37:40 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261124033740.833270-1-nilayvaish@google.com>
Subject: [PATCH] watch_queue: use page_private() accessors
From: Nilay Vaish <nilayvaish@google.com>
To: David Howells <dhowells@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

watch_queue records the number of the first note of each buffer page in
page->private, reading and writing the field directly.

struct page is being shrunk as part of the memdesc work, and its private
field is one of those that will move. Direct users have to go through
the accessors before that can happen.

Use page_private() and set_page_private() instead, like the rest of the
kernel, so that the code no longer depends on where struct page keeps
the field.

No functional change.

Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---

Notes:
    This patch was written with the help of an AI coding assistant (Gemini).
    
    Based on next-20261123.

 kernel/watch_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index e2bdd5fb0db1..eeb7fb9bc0fd 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -71,7 +71,7 @@ static void watch_queue_pipe_buf_release(struct pipe_inode_info *pipe,
 	bit /= WATCH_QUEUE_NOTE_SIZE;
 
 	page = buf->page;
-	bit += page->private;
+	bit += page_private(page);
 
 	set_bit(bit, wqueue->notes_bitmap);
 	generic_pipe_buf_release(pipe, buf);
@@ -284,7 +284,7 @@ long watch_queue_set_size(struct pipe_inode_info *pipe, unsigned int nr_notes)
 		pages[i] = alloc_page(GFP_KERNEL);
 		if (!pages[i])
 			goto error_p;
-		pages[i]->private = i * WATCH_QUEUE_NOTES_PER_PAGE;
+		set_page_private(pages[i], i * WATCH_QUEUE_NOTES_PER_PAGE);
 	}
 
 	bitmap = bitmap_alloc(nr_notes, GFP_KERNEL);

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
prerequisite-patch-id: d52d42a2ec9ddc2b12b3412ec0d07254b417e60f
prerequisite-patch-id: d8338f943ba7ae297eefbb26dabc3bcfe7994461
prerequisite-patch-id: 3d99b53c242296b89d7f7b41f1995188f5a02369
-- 
2.56.1.839.g22a8290db9-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770044;
	b=Y1Mz/h0jeQc9ano75W5+3Kt2tXnYGpLPbElxcPj1C8WBb/rqn+60J/+C/uH9YXAJ0knX
	 hEcIvcg/ZGZoVZa3JgPKzH3VOzolYdd2b6ub0/0tlWNFYgXFaDDo8DKQQ1F7pcgovpH+1
	 bBIqq7Eikz3HcPDMwuPzBjwljBfejaiNqu5wIDpItmtFtsf44W+YmRxBvha/hNurQZdzi
	 39xmeHE8zJDNko47YJGRGH0L25a02SyVa2LVremBn3lOfO+PgR3vYL1b9XESZCPzK9GF9
	 rD2pQLJdpu1RoTn4HiZE5qx5/R7Zk9XGwrjMSBPJaSym1hQtK6POsUFeBf1cju7YDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770044;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PemHAwyW+U+iybF7zh11klbOzuIEsXdauTMcn9jFZPg=;
	b=g0xua+JHRBoumqn4cKS4ticopj0dJ8hbl15I05EhDU9IdOXAyWeSClz4ykW/04Gmw2SN
	 9cSF1l8UO/0YqZTZeXWHT6Pvcdg0gco9tTnBDmLoTLMquTiuIcPzgBomkush62Tn/GS9c
	 82ZJ5uwzqEpwa7ahVStpPe8Qzi9ZEsuikatFThyDtIdCF+3ELpRvGlKVbakVN6QZCpkJI
	 mQaF7yskmyl6B0i3IhaIV7X/CrbKyRm2uggkWTBcfKOZAKMEZA2TJ7KiZmgWfkVWC+ff3
	 mC4AFBySsFIqiNuBbJWDnTrPXucgroLgbUwb7HCfeDGiTggH/URb3P99+ZojIG3jMmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4B606A695
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C4B606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04b676219so43227275ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770039; x=1796374839;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PemHAwyW+U+iybF7zh11klbOzuIEsXdauTMcn9jFZPg=;
        b=JsB18/hbjXIIogC2uO2f9LE6dtr46BO07ow+l93PNYCUmSxNxB66mMrf5o2v/Xjcep
         Z0RNgVPV5GDqg/kBPr+FRmU6z4vEUn8PQtSrIDEfVIPxJCqcy5jae0wfG32I3NQam+7b
         DzW4Ki/g6AFmgfoU4GE3/bsBxjZrn98NCjaaRdD7NsQWqz9mO8ixhi0W1ABEbwrOKuQI
         78lz8tRB4Sgni21HCz1NX9NM7MbRtDLRtK5gGK99Wf7hI9zX9DGitZ3KqZMA+QgMmCtK
         npeC9zsfx1D/KTF3iqBaf/abqkkQqtbrXEzskm4SjT9Oz2wTqhobwN+Nz40SSn944ZkS
         RSTQ==
X-Forwarded-Encrypted: i=1; AL+hErHN4yis+cld4mq7LuosBZb/mexYCYGheMyw0Mkzyd7HjwWnUmuUg1uKCryAiTS8PeV8LgGDh3h0OLpVc4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bKVuWxkU4wxv97p+YGot0w8U9IclOmYVpwDLyN4n9OLR76+ja
	Bmv6oDx0MBowMr86X3EDFtrYIAr/VhBMD9VtExkX1vbIdlbb7azkoIQr
X-Gm-Gg: AZFdTZdlYpcjrnXomgaKJ2/TYTMy5IhyjVCsl3FvFpyStdkkpBocjBqcL+EM/Qm2st5
	Gs8rYr4RNnttd5pLZ9kGeZwnGKkYA2l+cp91mW8KRF4xaFqrBbiNYjoLpOIZB2v1hNBqKIMMGkb
	4qKKKvZ3Ivt+umXn8TwhwtcgpuQ2PRVaOx3j6rBYdoycIJyblQFas9bmkA1m+iKKWAScPV27kVm
	xppl9IWuGhV8zyiihziu0zQRoXOE30XN/guuT/rFX7qelei3xADYiYUkBG2pMPJzQUDEce6kwwy
	C7t9c39JOlaMZd76apZ+6EpglMoksGW/kkTtkd5gpD0h2JRHHd9VKd/U3H0e7mIIrQ6efy++GO5
	1D4FLDM1AfmsxtSQSrLJ7jBdYH034Fa1i8MQTHFWbxfDrrJ2r+Xk2TOornNO8KAjuGSEcdvcIfb
	NdvHDx3GoDQPqxsGGCYHwAPOkdrX5G4o1GWUgWg7ux4iQ49kESgPGYk411s+8GoimoW0PULPt7t
	Yocsa93fm9kK9O2q76bfFhJlyCKB6EDz5005FGC33AkVyjdX8pK+ij/1aVUo6Bk9OditZFk8EnG
	3Ddk0k5EJo6d7AJzTqft1GHFTZpR0TEoy0+aT1kgkuTvMwQp7jDER95BZNKvj6NhlKc73vgbBiG
	OIN7n2Q+/xR7j5iYb6bM4QDPUIdcJ6QcLOmIy10ybf6Id/w==
X-Received: by 2002:a17:903:3d06:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2f03f188468mr235430835ad.37.1795770038979;
        Fri, 27 Nov 2026 01:00:38 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:00:38 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: speakup@linux-speakup.org, linux-kernel@vger.kernel.org,
 chris@the-brannons.com, kirk@reisers.ca, w.d.hubbs@gmail.com,
 stable@vger.kernel.org
Subject:
 [PATCH RESEND v3 1/4] speakup: Stop catch_up when the synth is not alive
Date: Fri, 27 Nov 2026 17:00:35 +0800
Message-ID: <179577003534.23588.5245624279568953026@kylinos.cn>
In-Reply-To: <179577002884.23588.802785530849276690@kylinos.cn>
References: <179577002884.23588.802785530849276690@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

When the synth output cannot make progress, the catch-up loop in
_spk_do_catch_up() (and its local copies in the serial synth drivers)
can spin forever: nothing tells it that the synth is dead.  This
happens when the tty write keeps returning 0 because nothing consumes
the data (e.g. a serial port with no device attached), or when an I/O
error deactivates the synth and the loop never notices that
synth->alive became 0.

While speakup_thread() holds spk_mutex across the loop, any
synth_add(), synth_remove() or synth_init() then blocks forever,
reported as a hung task on module unload:

 mutex_lock+0x54/0x68
 synth_remove+0x28/0xb8 [speakup]
 _spk_do_catch_up+... [speakup_apollo]

Check synth->alive in the loops as well, so catch_up() stops as soon
as the synth is dead.  synth_release() writes it under
speakup_info.spinlock and the I/O error paths write it without the
lock; the loops only need to eventually observe the change.

On its own this fixes the I/O error case, where the synth is already
deactivated when the loop retries.  In the no-room case nothing
clears synth->alive and speakup_thread() still holds spk_mutex
across the loop; the follow-up patch completes the fix by clearing
synth->alive from synth_release() and by dropping spk_mutex from the
catch_up() call.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/accessibility/speakup/speakup_acntpc.c | 4 ++++
 drivers/accessibility/speakup/speakup_apollo.c | 4 ++++
 drivers/accessibility/speakup/speakup_decext.c | 4 ++++
 drivers/accessibility/speakup/speakup_decpc.c  | 4 ++++
 drivers/accessibility/speakup/speakup_dectlk.c | 4 ++++
 drivers/accessibility/speakup/speakup_dtlk.c   | 4 ++++
 drivers/accessibility/speakup/speakup_keypc.c  | 4 ++++
 drivers/accessibility/speakup/synth.c          | 4 ++++
 8 files changed, 32 insertions(+)

diff --git a/drivers/accessibility/speakup/speakup_acntpc.c b/drivers/accessi=
bility/speakup/speakup_acntpc.c
index a27e6bbf05da..fe19ba3f0005 100644
--- a/drivers/accessibility/speakup/speakup_acntpc.c
+++ b/drivers/accessibility/speakup/speakup_acntpc.c
@@ -192,6 +192,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_apollo.c b/drivers/accessi=
bility/speakup/speakup_apollo.c
index d2fbb3f57221..b62696e050fc 100644
--- a/drivers/accessibility/speakup/speakup_apollo.c
+++ b/drivers/accessibility/speakup/speakup_apollo.c
@@ -157,6 +157,10 @@ static void do_catch_up(struct spk_synth *synth)
=20
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		jiffy_delta_val =3D jiffy_delta->u.n.value;
 		full_time_val =3D full_time->u.n.value;
 		delay_time_val =3D delay_time->u.n.value;
diff --git a/drivers/accessibility/speakup/speakup_decext.c b/drivers/accessi=
bility/speakup/speakup_decext.c
index 271bcf279bf9..e6be5a99670b 100644
--- a/drivers/accessibility/speakup/speakup_decext.c
+++ b/drivers/accessibility/speakup/speakup_decext.c
@@ -171,6 +171,10 @@ static void do_catch_up(struct spk_synth *synth)
=20
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_decpc.c b/drivers/accessib=
ility/speakup/speakup_decpc.c
index 1bf36d1e5477..cfafd9475963 100644
--- a/drivers/accessibility/speakup/speakup_decpc.c
+++ b/drivers/accessibility/speakup/speakup_decpc.c
@@ -391,6 +391,10 @@ static void do_catch_up(struct spk_synth *synth)
=20
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_dectlk.c b/drivers/accessi=
bility/speakup/speakup_dectlk.c
index 56334405d865..d9247c53d327 100644
--- a/drivers/accessibility/speakup/speakup_dectlk.c
+++ b/drivers/accessibility/speakup/speakup_dectlk.c
@@ -246,6 +246,10 @@ static void do_catch_up(struct spk_synth *synth)
 		spin_unlock_irqrestore(&flush_lock, flags);
=20
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_dtlk.c b/drivers/accessibi=
lity/speakup/speakup_dtlk.c
index fa826568937b..73cd39e781b8 100644
--- a/drivers/accessibility/speakup/speakup_dtlk.c
+++ b/drivers/accessibility/speakup/speakup_dtlk.c
@@ -206,6 +206,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_keypc.c b/drivers/accessib=
ility/speakup/speakup_keypc.c
index 9356f6379560..e229009107f7 100644
--- a/drivers/accessibility/speakup/speakup_keypc.c
+++ b/drivers/accessibility/speakup/speakup_keypc.c
@@ -193,6 +193,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 11cba1fd8715..6a49ff475c16 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -75,6 +75,10 @@ static void _spk_do_catch_up(struct spk_synth *synth, int =
unicode)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
--=20
2.32.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795351046;
	b=sj7lBgpYrBqFw/Jvz6zPVU4MXf9IxTPNDI+BkFChE1A3Oyb0aX2rn59CCguW9yIzZlNr
	 02map+B2AvZgEo2cPb8Q3aBPhi5HKTL7LP+uK/WVejKXYQB/9UhO+vn086ZtXp0HAYo0D
	 GHRjF36e7LPsAGZk5ZouZoa0OZK6vF5UhGU1O3F/9S26iN0Uj5Bc8qrh8YhDaSmTmB5u3
	 Jzb5ESQgbrNpFI5/2T2yOiFhWsxkR/d5Dxark3ImDCOlMkP/HDTKUGTtiKXqas8BNZy44
	 qFFcK4lfCJ5vjtq2R4IZAZT2Jd1FXkPEt4HWFIbWZhwoVLIs0Kl+GyFI72HvtxfDmNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351046;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=nS1Wyq0+teU+0NPEh7FueTOvVWx377NaWwBlgjjiVaM=;
	b=R3+PvxR177scqaN1r1mbhuLYwUiO2xFTkw+ZxMGhs6Xl7ox9JZf9mRPs5XsMFoObUqjo
	 y22l+dQSE/vwKWeSXi1htmbJheuYB7wBaNCZ1nxwhmLs7jhYv0cx1z2t+D/FOX5ADtdQH
	 ZDTjUCIGLfI6XWfJc985N6Xh4ff8nQMkosd8BuALlouGls8cNDMLkm4hcPPyKxVQrQ984
	 ijPLjxFpwDisxXjAkfAR4RlULKPKFSqMg57CS2ILlSiBplCbJ4vNFP7vKqq5K2zMcIB7B
	 xWUxG70NLhYfqossgC5b7nqMf9lllXTKkyvyLbeFMFmi7pcbRuvmZz1lPmRJgh2oE+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pl78x+Zb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4014C606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pl78x+Zb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795351045;
	b=AUzRbPBd9jJZFrJv1WeJZC1I4/xGQj7pny4FOAF6KqckiJ52L5KdVwpEn4PolxdUKMyH
	 Rwtq2TbpWNPfrG//vOe/DW3tzJRSGxjuTLfBgXM/F3C6wob6CB/ENKAHLKkWXOe+YLja1
	 SHxM6WpLzwo6a10rVlvN5kJgntqfgoEZeW4/8E4VHNimuYRgfywOBEvVncTftjCbN649P
	 qfBBSrvSVGiu/601HOPyPti2s/kHJto/tTxTfgFFOFLt4NoVh3MJC5zvzKtmTavSBWPuu
	 cMXIBt6XakQSF5M3CZNcT1t5vCe5GjIi598KPDDOebWSizlxfurVfGkl1/QoWEziivA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795351045;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=nS1Wyq0+teU+0NPEh7FueTOvVWx377NaWwBlgjjiVaM=;
	b=K7tCC1YGjI2rwWkDwKaRjZo27YHjM2Ljqk5iKGGMpeShoZjJlyxwUNItxU5Pw+M8fxfR
	 ufO8vC8RglNqw0nnQe9IBCEWWJA0Kz3R17P/+hmmp6RVRpMYALCB+jhePr+084TcJJA8U
	 gQDi6t5GO399OxaHy56q3tqZ0Aa6cnzFEuez6dzxV75Iyy2BShPfpfGiWqRZFfdbo/OEZ
	 CK7BS1DAfI98svb84hIT88y7sWUprdRb8Mvhuz9u41LwENuu3fzLXl54noU6RvXW6sH1h
	 2TmgIWkB7cUHUDEl6Idc6aHl8l73BhdxQIQ49x6EpvwpsL3lFO6Jp5rpkaPf0nin8CA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F8791F000C4;
	Sun, 22 Nov 2026 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795351045;
	bh=nS1Wyq0+teU+0NPEh7FueTOvVWx377NaWwBlgjjiVaM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Pl78x+ZbHLXHOA1CeaR/tzviB4YaDS+6f87Lem7hbHRv0kr1bUGwZea5Ba+cxjuj7
	 eBqE1KRv0UgRt1DX/ohPYjwtYVfODUd3hHirHgPLXo1XKu36G35kUfV8wAEufkqFcf
	 DdXKbl/wo9RUD4tZ8ox7QfTCBKbSksWKHq98ZYk1ASHz6PjRwR0GMH4iPB0v8XRmUH
	 XIiBiKQj93kMlxu7pkgAfIje0MaYxcEqzA3TFnqhbx8Wenx+xWYX04mgGzZflO4iOx
	 ks1fLHKqrsmj/V2FtMqtlQ+I8dqOGi5srfm/B0RndVSrJro/FY3LDAIos95sfChP1K
	 vpSumRDB7Dvjw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 90BDB4C02B;
	Sun, 22 Nov 2026 12:37:14 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:37:14 +0000
Subject: [PATCH] um: line: Free the read IRQ when the write IRQ request
 fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-uml-line-irq-v1-1-64b525cf8d2f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPnhAmsC/yXMyw5AMBCF4VeRWWui4+5VxMJlMELRIhLx7orld
 5LzX2BIMxnInAs0HWx4VhbSdaDuS9WR4MYa0MNISkSxT6MYWdldr8JPieIYkyCUCPayaGr5/HJ
 58dvs1UD19jbgvh/S+U5ncAAAAA==
X-Change-ID: 20261122-uml-line-irq-39ee77284512
To: johannes@sipsolutions.net, anton.ivanov@cambridgegreys.com, 
 richard@nod.at
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795351033; l=1580;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=EbX7KODF5wd8UgFNPa78Kwlbo1tt/cnAoI1sKqIv8xo=;
 b=aJAuyN16nWR2Vppc4QoXL1GhbRI+Pv7Eg/ats+Kvd4l/cImMnwPfjvpR06CzeWnvnPwoXf2QL
 Y3JSi2SS7ULCUub3MVqA8RxPuGPJQ+hWe5hFPWJyFhlzGLh8hJmiyf9
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

line_setup_irq() requests the read IRQ first and then the write IRQ.
If the write IRQ request fails, it returns the error without freeing
the read IRQ. Its caller, open_chan(), then calls close_chan(), but
close_one_chan() only frees the IRQs of a channel that is enabled, and
the channel was never marked enabled. So the read IRQ stays registered
for an fd that close_one_chan() then closes.

Free the read IRQ in line_setup_irq() before returning the error.

Found with a static analysis tool and checked by hand.

Fixes: d14ad81f800a ("uml: handle errors on opening host side of consoles")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested with ARCH=um (W=1, no new warnings); the failure path wasn't run.
---
 arch/um/drivers/line.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/um/drivers/line.c b/arch/um/drivers/line.c
index c851a592809c..5589fa68871e 100644
--- a/arch/um/drivers/line.c
+++ b/arch/um/drivers/line.c
@@ -273,8 +273,12 @@ int line_setup_irq(int fd, int input, int output, struct line *line, void *data)
 		err = um_request_irq(UM_IRQ_ALLOC, fd, IRQ_WRITE,
 				     line_write_interrupt, 0,
 				     driver->write_irq_name, data);
-		if (err < 0)
+		if (err < 0) {
+			/* the caller won't free it, the channel isn't enabled */
+			if (input)
+				um_free_irq(line->read_irq, data);
 			return err;
+		}
 
 		line->write_irq = err;
 	}





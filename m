Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662945;
	b=XaCgb92fT0lkyP1dYzA16ZdrAnlh18a55UyaM/4Zy+8L984EexqfmEW73S4uduoGxGSj
	 YAMvgGvjbTIlGSo9f18pALz0JmxRe4xrLq/6tSD/mmTo+zqUQ5rDPg3WC+Oh6jjngh63K
	 rB/NbI10B9K95Uc8tGTRJaO2GgThpebj7RWqaANpvvvLmf74ASRinCRextRSD3jBSHKk7
	 i7/rkZ/Z9mc2q1bYxOZ1czpwW9MOmQ2KFVOJHjdq8z5Z2ZzUkzo4SkKxybECnHSFZ1yO3
	 Z9PPDm/JqIZNxndF+KTyC+ChayMirEIjvYUgVhVYXbd8WqRyWpk+YOEXuzRGmjFotWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662945;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZSmv7LTcmbL4aQ49F7az28aiJc5rqxHA7rjPOy2NtXg=;
	b=PtQ6cO5bPC1G+eoonX08bRr3Gkk+dVeBElomq6xJFcvx3Fd9VQF399mnxLtptWNvQwwj
	 DKScYJlJydciSp7j5kGCtihUk07wMV4OGciSfzqXpIrMkrFG0IHnK3TQB8WquuVarl5Uf
	 N4mKWHoNdg3Bw62AekX4VhOCGojVeDYx8YhDfS8vIJuDMODIRVy+YbDs9hAXW9xVUkhK+
	 OM2XlkXkTi7XkiP/9Qoully3BaPHInri63Ry6DL2mt0U7p2Mpzmkl+qx3oGSpbmBSwpSl
	 p9dyNPpl4vIoaPR+cA3Zmb4PXYilsfh8Pq5F5TNJEEOC06ic8IrVzoclVd+iBcn1DaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aV5HkW0A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613C606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aV5HkW0A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795662945;
	b=gyWjPmjtNxkrrR2p22uOGZSozQf0Cg3kyEuuzoDTjb1iNi+nmDY2POyU1nsO/VaaPOGs
	 RY+UKHFseAL+YYqslUqkd0U34NkHd1lkc2IyWp2EubMpIFurOngI6V0TpVP9CfjfIXD1B
	 tVdqQalrZG26bQFSD6YNa53UIpCKoArr4whWD7bH8OogRY+xLyAUta8Y9OgxA4UfHl+hX
	 ssdXkBg2/h4O73UvA3jqiLuBIIBUFPv2Sfk/iylf/7gOv54DMfLDySfln7zVSlrXb2kq/
	 DqYdhXkrqvbrjjvQmUHiaQs4Kxgb1REcHQD0knKlPHFYcDOyhrD6FRZhuF4uV8TXP1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795662945;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZSmv7LTcmbL4aQ49F7az28aiJc5rqxHA7rjPOy2NtXg=;
	b=e0wEDc2O6npA+5zaZTsw1bfMhEzYZElcL6yjtr0e+mUDn6R76YxOxifulKC2sAQIcGgg
	 zQVvlzxti6OwroL4TQYxb6AljGZhJHv6suF/AKmDmMWKqWH7fQUSY8QLbmlOjKQytanB4
	 TYsQcuoFOREYSAOB8V+e7xIy4BdCVcjFgzvtvA15QS5ya9ft9u4VHALqsJg6/Dq2GFa35
	 mV0OYJJgdG9xBf1XFIzhBMlUhneW9bJ2y4qcC39AYAM+uEMbJSLkLvJPW7TSyibWDGzh1
	 pexdkYGMDMsRwSFDt0mSTKVMj61KdVTJeR1BxuJ3f6/4nDzh9CA0TRdkCZBE7v/a/JA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E3291F000C6;
	Thu, 26 Nov 2026 03:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795662945;
	bh=ZSmv7LTcmbL4aQ49F7az28aiJc5rqxHA7rjPOy2NtXg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=aV5HkW0AhFeiFTdi4TKO+lq2HxkFlp76nZBHcstkJES39wzzJi48sEoOB3pbKqJdJ
	 Xjb4ULlqLI1zUWSuuww42UA75MuMhmcAzuMG26UOh9EzKPcWrqgyxjZ9Lg87CRydEc
	 tmFXCEWzd08rgSqPWpMP9gP4hPFW6VNIiNqfBsfOHXwSlWcZCl58nx1whvxmpyjBep
	 zya7c1GOHEb41xUHMdRNX45qBc1DcylyWXgKkjgqoLe8+uAKP57XlxEHO5f4BG47TP
	 LrXRcutedPAsWbz6GX5xjRKMErbpc4neaoEblyamE+J/Te2LGmTZMK+EQCgfXxsVIX
	 dpQAVFlsG8yyw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 202774D1C9;
	Thu, 26 Nov 2026 03:15:43 +0000 (UTC)
From: Hank Liou via B4 Relay <devnull+hank.liou.mediatek.com@kernel.org>
Date: Thu, 26 Nov 2026 11:15:43 +0800
Subject: [PATCH] drm/mediatek: dp: Disable HPD IRQ before cancelling
 debounce timer
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
Message-Id: <20261126-mtk-dp-hpd-irq-v1-1-0b8663980732@mediatek.com>
X-B4-Tracking: v=1; b=H4sIAF6kB2sC/x3MQQqAIBBA0avErBvIgSy6SrSoHGuIyjQiEO+et
 HyL/yME9sIBuiKC50eCnEeGKguY1/FYGMVkA1WklSKN+72hcbg6g+IvrO3cTto2xJohR86zlfc
 f9kNKHzLLnKdgAAAA
X-Change-ID: 20261126-mtk-dp-hpd-irq-5fc8b6f72e6e
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hank Liou <hank.liou@mediatek.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795662942; l=1945;
 i=hank.liou@mediatek.com; s=20261126; h=from:subject:message-id;
 bh=l8xHL6bFv9F0w89mKejFr4yktC399A1FMDm4H5KqRU4=;
 b=GMsAhPoL7vpG1VsZ4mqOsHWU7s0UrcQwn0VDsAGlTrnk2NTX+fHABoTmEUf+xrjgHTZSOx5qV
 8qi+ncW7drhCPh3Y5V+fsYw6ylYT6RVz4Z9L86R0hWFvc5cCKTeJoHC
X-Developer-Key: i=hank.liou@mediatek.com; a=ed25519;
 pk=oQN2zU+HMrJQgqX4bhL5CVRrBmac4amZ/53yK20L/6M=
X-Endpoint-Received: by B4 Relay for hank.liou@mediatek.com/20261126 with
 auth_id=1646
X-Original-From: Hank Liou <hank.liou@mediatek.com>
Reply-To: hank.liou@mediatek.com
Content-Transfer-Encoding: 7bit

From: Hank Liou <hank.liou@mediatek.com>

mtk_dp_remove() cancels debounce_timer with timer_delete_sync(), but the
HPD interrupt that re-arms it from mtk_dp_hpd_event_thread() is
requested with devm_request_threaded_irq() and stays enabled until
devres runs after .remove returns. An HPD falling edge between the
timer cancellation and the IRQ release re-arms the timer, which can
then expire after the driver has been unbound, when the struct mtk_dp
that embeds it may already be freed.

Disable the IRQ first, which also waits for a running hard or threaded
handler, then cancel the timer. Do this before the runtime PM calls so
the interrupt is quiesced while the hardware is still powered.

Fixes: 4652e95e7ea6 ("drm/mediatek: dp: Add hpd debounce")
Signed-off-by: Hank Liou <hank.liou@mediatek.com>
---
Fix the ordering of the HPD IRQ disable and the debounce timer cancellation in mtk_dp_remove().
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 974c4fff6..7a5e380fd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2865,10 +2865,13 @@ static void mtk_dp_remove(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
 
+	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP) {
+		disable_irq(mtk_dp->irq);
+		timer_delete_sync(&mtk_dp->debounce_timer);
+	}
+
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
-		timer_delete_sync(&mtk_dp->debounce_timer);
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
 		platform_device_unregister(mtk_dp->audio_pdev);

---
base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
change-id: 20261126-mtk-dp-hpd-irq-5fc8b6f72e6e

Best regards,
-- 
Hank Liou <hank.liou@mediatek.com>



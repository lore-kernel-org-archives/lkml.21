Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267997;
	b=yIUG2hSQgEzJFJ8eirzZtd8XyzB/R7RHJ4khLM2vNEq2loheJ8n66R8wdIu16I/CbV6h
	 EaeDRo3NN+cWmBFJrp61zKkuY65nEJVU1YtYhH75B9qzSQOLQCcHgq5YcVynBQPxb7v5b
	 4etKEWAkIFfUGRmJqXvMVwJAgmiGn+W+MzkhturnMcExPUpBn4w7VqXGE0/cM8OAdUiA5
	 fIZNKFlYIwgbjhoeaQkc7vMJcTiYwvd3LJ0ebmgpQz2DiKruW1NWCqr5Uh+ngpN6sn91k
	 5sqBdvRFSzQgszCzIXijlF2aaEm3+8G2L/8S+hu3Y/EaDU0oBDKedfT/Wdchs3WcHOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
	b=J/3IrrbcxSb2lQ/gqdLMezbnvwf2TpYgZ5GCk/caVXQV7EnFoYNzE0U7iXbIucylBRCa
	 83vQthLnL+QPWEZrr+rPAZKrny68u6nK65iVg0t1yGJg5N+S7dsUOjN8GztE863JjayHU
	 2JgWflM9EeIB4HOBKF3n0nyOoh6R6LTqezBHBJAUiaNHiJr6+OTV6v3KxJUsSLweaYuFv
	 IqZgHRo7rW72tCkb0LS1Zzzyk/A5C8hAy9M1yCqEB/zcDbfhn8LLtXNowL6fBvVRyXqgI
	 oTq9mrRrs36p2Fexj2oWEk4orhfGCYYHuUmXjOtWPDzPqqrFSgwFWEReyQAYVzq11Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjVRqs56;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F4606A6B3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 269F4606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjVRqs56
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13755055e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267995; x=1795872795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
        b=DjVRqs56b8Yo76Sv6sg1jA+fDVfY5EnzgIbWCxFYUy/sclk38bDySneAMTORk3xXBX
         7XYBTEBH7tm8YTTSiGNgjZmHto3sRjJ6Ib+ZYHXpMJ72FxXzQbdRrMQczUclwqDX4EAP
         PqU3iuJODupI9dkvczG6gzIxYiUHPXHKMPcdG4bIvoLPYjOAiZHV4tkJKCQ+zMQieQBe
         Qu/53oQwQ0KTUfGf8/fza3U6Na+dq3mnmkIbJar+b03LRgYTrWL9qyN19kxdbTq2NrWz
         2kZMRJfSVoXpCf2QGoui5CHP3VdVa3gn28p35gkFJ1GgOUhrtVYoOqOsH0tt5D/s2l7a
         QaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267995; x=1795872795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
        b=xAwZm2P4mLuQ3a0aPbiGMTu1w6pX+pMb85baKnew1koJKZ9qlEkoI2r/3Gzjh1+DT8
         bGeZ1ZMS5zhPAs6i6lrS5MeuwWjpoqwG3lTX9Cm9BppZDVdQy+z4P5fqiqmuY3yAHWC7
         O4dmFTsxiKyIqjt84UaNoXwI2gPob+BgX8FlXKzBpaqMsOQbP1vQBeJJO+naAOLxaDSP
         AmImScxX7SUlbNG0bXzXOPoJw7yRCbJtmHXaUhOA8sUk0sxh8x6qaUqteS69gtrrCOhO
         t95Uxq9nKyxrtPfIZtFLD8jTqZaAVSc0D7k8tN7E/rNO6poenUo0UEvKK1JIT4IJAGY2
         8Ehw==
X-Forwarded-Encrypted: i=1; AL+hErE2K6TFKXv//NqEJwPqfgnQEZqZGbQz+/AHdYcQfJh/DabNn8w/9X8tjNvfQWyPGd5ASF1h16QXiC3e/2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aaEM+AMaGM3BSOwE9EwF+NIHKhPd+FctoymzjABXle/ZjmaVd
	Cvrp1U0oqvPME2ZJIzf8fjujP8SybUQsYiLAvWWoYGCX2tr/tDoi373l
X-Gm-Gg: AZFdTZdcPffJmw86TZGy2HWll19fyXk3ssA6rUjt0JxwmiDkNoutIJiYpam3eePIl0W
	QTnhB6Q1VGTXy49as8oS1qiG9aINAKFCGjNNJcUXvcdv0l2CZt4MuZaDxZ5J+wzCmmFQtwun2r4
	hhq7D2SMqqacK27fkNPbEhZmnBdFt/t2H3IAOlJfb9Kzxpsf5t2IuhfyAnA3uA2+lcN1PcallkV
	62yumISsY0ChG0Nsuq4D4i304zaFsVn7eZvDUWPtDR3f677lXxSfQqvF/2NxIXCnGK5oUC7O0Q0
	8RfAAoxJGkL6J0h9T9VZsJ4iZpXyMB942oXd1UeOh34DqfIC9RkFJL+TKmJKYo3AKAhefZkfznz
	ke+wusmWlHDgYgPrCruoOMqOgnSBQFJG4CRm89KuDVF61sBwZAXCFgqoqRaGRTPHqqXPNzKz9t7
	nJIYhvd++JT+o0fm6gaR24k5wqUkJjEqNhjPUUQtbMb8q2aKKh3m4nHyokTpGL8NiXLtxNDMwca
	QrAxaW1CFvN7t06IfRHm1jNhFAO9WkKA4tM3ftG2tP3kxRrUkf3lhIIE9f4LdNEZeYxYEDsSMyv
	LySG3fjkuxTfr4XtrvhBrnFkcqCzQhZEGuEb/RXKRnf3/Cg7cE3rIw2YwbshsrqYKyazdP69Zzh
	/D7ND8T5tBkHNqcEOgJLujUoVuAfw8xdzDyE=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr149002085e9.12.1795267995455;
        Sat, 21 Nov 2026 05:33:15 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:15 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 14/14] media: atomisp: Preserve the capture graph when a lens rebinds
Date: Sat, 21 Nov 2026 14:31:44 +0100
Message-ID: <e19d87138eaf283350f85ace17ee9ee4563e9423.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The root notifier completes again when the lens subdevice is rebound.
Rebuilding the entire graph adds the original sensors a second time
and attempts to register the capture video device again.

If the capture node already exists and the sensors are unchanged,
register only missing subdevice nodes. Reject a changed sensor graph until
the driver is reinitialized. The preceding V4L2 rollback fix keeps
existing sensor nodes if new node registration fails. The X91L rebind
trial exposed the original issue. Codex drafted the notifier change.

Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/2PUHZIDBEIGQKGXTJJOUXXJS2EOEMJGD/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c     | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 56da454f0..72048de9b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -508,8 +508,23 @@ static void atomisp_notifier_unbind(struct v4l2_async_notifier *notifier,
 static int atomisp_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct atomisp_device *isp = notifier_to_atomisp(notifier);
+	unsigned int i;
 
-	return atomisp_register_device_nodes(isp);
+	if (!video_is_registered(&isp->asd.video_out.vdev))
+		return atomisp_register_device_nodes(isp);
+
+	/*
+	 * Completing the lens notifier again only needs a new lens node.
+	 * The existing graph is valid as long as its sensors are unchanged.
+	 */
+	for (i = 0; i < isp->input_cnt; i++) {
+		const struct atomisp_input_subdev *input = &isp->inputs[i];
+
+		if (input->csi_remote_source != isp->sensor_subdevs[input->port])
+			return -EBUSY;
+	}
+
+	return v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations atomisp_async_ops = {
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089786;
	b=QdwOxlMgVkZAvVpRCaoEzjXr1jcP/cWkqybNQSuesxEVfFpEAhdGa2VJ707BWAEVvrC2
	 TkHMJ0t36LH7ZyfVVjKo1eO2I+xw6IWYLm6EvTxagHlGZpTLqGElXvhcoAj9XSP6l1Z8q
	 cOihButeeYgyGLXjx9y9/I7ea8Ubv1w0dc2rp2KBQ6STq+WzuyqPHRbuieWRGFbF4LU5J
	 U++XD5bz4v0kiZU0qE0gRLlpuJBQ+mz/VlaAFWNzMAPV3RWPEXqHLhs5Nlz6EXiUDYTZf
	 IKgJI4aS46/THMtLnexxm96cud/mgDr6JNrFA0NmvMvuEhwYYDLpDZ7kELVybiy9b7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089786;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=VZKBiBZ5EwpyOapUDbG3ayhblSKLTElB/6S59DDHCAw=;
	b=QYuIU9Qy126qShjZUZNzwWzuNW8wqhHkGaf44h5/eIe0pZBU2iytKkiG/gP2Ewz6GyRf
	 QhC0Mr1kVoSyqt6nSGAyxBjagLS89Gn8gXZvw9JvnGG0ipTyDOmcaV/AIAm/v5YhzW1o2
	 Ei0f0FxF3A/ifZxk8x3CUUQX/0qY/hSzPinrPcN6wpgU3pSkXFRH7YRN/M32hqpr3tjPl
	 jJ2Uyv8cFC0oFjJidULr09oZfmKFugm+xNyudUxbuyRDDpf0uqyBZSb7hxdogF1D/apjV
	 AJZaBvdZ+bYhLgL7fzxH/GDRf05K83kPtrJwepbLPnAEbm4u5w6u0RIaV+Ku8968bew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dtG2StOc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H0VIxRwA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C9606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779C9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dtG2StOc;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H0VIxRwA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZKBiBZ5EwpyOapUDbG3ayhblSKLTElB/6S59DDHCAw=;
	b=dtG2StOcyVkzOb1uwfqVUEfsqfD9A3Vq+JI7YYJ1xIFO+1J9mRj73Yga17IeqK2Is5z2mw
	eP3iPj7X6bfIy/gEtco3O/mqvMLr3J5wHjOX6Qh/+Tzc6vsXOBxERWvjK1LtsWbRrAp20X
	QE6u7hz5OXW9wsMHxsuq1VfSGOPi+08=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-QWg7VZvxOlysjxpvu2MQdA-1; Thu, 19 Nov 2026 07:03:02 -0500
X-MC-Unique: QWg7VZvxOlysjxpvu2MQdA-1
X-Mimecast-MFC-AGG-ID: QWg7VZvxOlysjxpvu2MQdA_1795089781
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4901562b819so1636805f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089781; x=1795694581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VZKBiBZ5EwpyOapUDbG3ayhblSKLTElB/6S59DDHCAw=;
        b=H0VIxRwA8DdwhWqSqlExa7da8ZWTgdeRtjVCek4Lzwxj1Jhv5USO4Vjx9IUibQZsDv
         +BbI/DtBEI9AEd3amBMKLRjeBecwi1eL7OVkkNU/RkCLqmrf2MwhJ14KqifQGGH+2U4h
         2dMhKT9P3CdIcjB6kKd9jyS23e/u3U4paAbd1jfJot2QfVQ6UVXjPxEwYHaThvX1QSDg
         PHoIGZVV+mqYO9NwFcs5v3bR0dchmuZnRdtmZXi59tU9nit8mLuGdcCGGL61j8EnBGxN
         lAEVGroPfsu/MLY73XkybldS+eYpJ7KXhF3WiLfNfjR5q4Lpd2G9bNI2YvMAPC6jm0el
         iECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089781; x=1795694581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZKBiBZ5EwpyOapUDbG3ayhblSKLTElB/6S59DDHCAw=;
        b=IW2xNCARWCQcZEDoV6wtHU6ghuZ+o6+BOgvfStCGgUpamXVt7w2JRoic8OemsJhcrV
         ZDcUnuG5IVDvWW+8XZWm3NhrryttiL0VvNHX6yWhAextTrj5d2FsSf9qZN32EXTXycRn
         qmHmtnm/vvCr7yBKXXU3IscFuBLnJe9kYLYOJXRCZ5Q0TG5Vmoad3IccnsL8pgW6K75B
         Jaz1C4u/K0rPfwk+ve8z76jdGCYfBhcF037Wl22BFrVkoHJktOdHxgkwqAkCy1++Jk0H
         Gz0a5JQebuCsSvxNjQs+bAznh8e2KkWqGLoMk1KMXqlD3nDDGzv8mnOSxs/l0Qw4eLJq
         Uv2Q==
X-Gm-Message-State: APuU4Z+1YYGjjTq+bjqod7UQySooB5B/+Pdx+usdU/vY8lavUL8Dy0qb
	qSZ04P6CMeUTbObGOYslNN3NZjvsBlVqrcsJ+3QtzdFSkJXSGp3iyqbCgL6KXsXotSZ1CVwgkH0
	/Vi0xwc9HH858T7y6HdOJZ62b0bJ2lvKkw3Eqtv+nu4O7puyLHPQ8xmlcpSR3eCVWY6AHDa86Ht
	wEjGRSTVEQEjXgUrbL529emMnhTEyAVQodfa1mOvEAfAI=
X-Gm-Gg: AYBFou2kQwNYXWczyDHCpM4z9fhjMlEyiWZhL6xQR4vGHIzG1UyPjdDvLS6XmsuTbfT
	BU6qGzElOllsw5xtc5CcwZSgmwVXDniRUQiHBJtHmpgLiyL3fZteMWuamSPYEbiZ4qpDUEUGcQZ
	6lLyK9oflwqSSeTnImNgSvCW9ORQTN2bGoZSJsU6ibK2eYWXp5wzsSii8o91EeA/1uM/9gV0U8A
	in0XdardbmNKgcDtVXndIS7H9lgyLt53XY9XKfYeUZAw3N7KBcM24puVJykAGdlx3s5IY8wHkOb
	qgSOay6/YQtdankczacUlGTFaxSi0KFjcpWifjvwmPildZ9Vg2pu+L1qp4DPVILwtZF+qtDhHGF
	9kuObwqr4MY1700hAojCkRxEOPccG9eXh5HK0c0iprS8=
X-Received: by 2002:a05:600d:6507:10b0:4bb:8636:dd7d with SMTP id 5b1f17b1804b1-4bb8636dd9bmr16334075e9.24.1795089781239;
        Thu, 19 Nov 2026 04:03:01 -0800 (PST)
X-Received: by 2002:a05:600d:6507:10b0:4bb:8636:dd7d with SMTP id 5b1f17b1804b1-4bb8636dd9bmr16333235e9.24.1795089780568;
        Thu, 19 Nov 2026 04:03:00 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526541fsm46002405e9.0.2026.11.19.04.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:02:59 -0800 (PST)
Date: Thu, 19 Nov 2026 07:02:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>, Dev Jain <dev.jain@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Gregory Price <gourry@gourry.net>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Lance Yang <lance.yang@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, virtualization@lists.linux.dev,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH v11 6/7] virtio_balloon: add DEVICE_INIT_REPORTED feature
Message-ID: <65c518234ce31fac3f6ed436455dcb415d4b1189.1795089715.git.mst@redhat.com>
References: <cover.1795089715.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795089715.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED (bit 6) device feature.
When negotiated, the host zeros reported pages on reclaim.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 drivers/virtio/virtio_balloon.c     | 33 ++++++++++++++++++++++++++---
 include/uapi/linux/virtio_balloon.h |  1 +
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 8c1b47ec17a29..4c6630c5f9599 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -19,6 +19,7 @@
 #include <linux/wait.h>
 #include <linux/mm.h>
 #include <linux/page_reporting.h>
+#include <linux/cc_platform.h>
 
 /*
  * Balloon device works in 4K page units.  So each page is pointed to by
@@ -205,7 +206,9 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	struct virtio_balloon *vb =
 		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
 	struct virtqueue *vq = vb->reporting_vq;
-	unsigned int unused, err;
+	struct scatterlist *entry;
+	unsigned int len, i;
+	int err;
 
 	/* We should always be able to add these buffers to an empty queue. */
 	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT);
@@ -221,9 +224,24 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	virtqueue_kick(vq);
 
 	/* When host has read buffer, this completes via balloon_ack */
-	wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
+	wait_event(vb->acked, virtqueue_get_buf(vq, &len));
 
-	return 0;
+	if (!pr_dev_info->host_zeroes_pages)
+		return 0;
+
+	/*
+	 * Only a fully initialized batch may be marked reported when reported
+	 * pages are treated as zeroed. A short completion does not identify
+	 * which pages were initialized, so reject the entire batch.
+	 * Subtract each entry to avoid overflowing a total-length accumulator.
+	 */
+	for_each_sg(sg, entry, nents, i) {
+		if (len < entry->length)
+			return -EIO;
+		len -= entry->length;
+	}
+
+	return len ? -EIO : 0;
 }
 
 static void set_page_pfns(struct virtio_balloon *vb,
@@ -1043,6 +1061,9 @@ static int virtballoon_probe(struct virtio_device *vdev)
 #if defined(CONFIG_ARM64) && defined(CONFIG_ARM64_64K_PAGES)
 		vb->pr_dev_info.order = 5;
 #endif
+		if (virtio_has_feature(vb->vdev,
+				      VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED))
+			vb->pr_dev_info.host_zeroes_pages = true;
 
 		vb->pr_dev_info.capacity = capacity;
 		err = page_reporting_register(&vb->pr_dev_info);
@@ -1189,6 +1210,11 @@ static int virtballoon_validate(struct virtio_device *vdev)
 	else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
 		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
 
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) ||
+	    page_poisoning_enabled_static())
+		__virtio_clear_bit(vdev,
+				   VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED);
+
 	/*
 	 * Disable indirect descriptors to avoid memory allocation in
 	 * virtqueue_add during page reporting.
@@ -1205,6 +1231,7 @@ static unsigned int features[] = {
 	VIRTIO_BALLOON_F_FREE_PAGE_HINT,
 	VIRTIO_BALLOON_F_PAGE_POISON,
 	VIRTIO_BALLOON_F_REPORTING,
+	VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED,
 };
 
 static struct virtio_driver virtio_balloon_driver = {
diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
index ee35a372805d4..17de46c629c2e 100644
--- a/include/uapi/linux/virtio_balloon.h
+++ b/include/uapi/linux/virtio_balloon.h
@@ -37,6 +37,7 @@
 #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
 #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
 #define VIRTIO_BALLOON_F_REPORTING	5 /* Page reporting virtqueue */
+#define VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED	6 /* Host zeroes reported pages */
 
 /* Size of a PFN in the balloon interface. */
 #define VIRTIO_BALLOON_PFN_SHIFT 12
-- 
MST


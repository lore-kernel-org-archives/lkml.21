Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514905;
	b=lUszR435Cmr9bhvJP9xsYJ4LU0s2qe9q5JCA5WkHZDr00ohHs5yTQIt6cf6DUpYLzyCM
	 InMwCsOlJd4FV2sFi/6UbFuNoiaAUqIui/Fp0rtF3MrOSkFAcTdnhbHqOsoBn+jgOVXvO
	 oxnSNLpRhLBDQCNbIYzTIkPe5iBsW8nHePnmRyYtPLnrQZjratUXAd72ieUcpvCX5HhFH
	 Yqook2mItOzH8WmtrrJ8BmUZuVBh1IyNYB+88w2daRdHu6J5+C4QBxFdXbw+z59T4pF+j
	 gNwWDK6GCA/OSrhP1iF7D88RiMWjpUYcdk/RKbiUJqK4rP6yaZw1hIKmE4Ett8jWiEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514905;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hqravjiiktSzG1I8B6hGi/+VxcvCn0dAKH3YSbgOfQw=;
	b=WqmzjztWXY3HQy+lmP8PRmC/+bJpWlI2bd1KS8yh7C2PhHwKOkFLxS6+646oFPn6QCOE
	 GF++E0rOWxZGWycF6ECUD9I8vkmFZnqTUJg1O87UI/V3yaHNjWN93nknGEC6xg5baX+11
	 5EwQbEkcK6w56vB/BAbCEg64L6smIxcy4bJ+LwA0S6aBXQzNGTE06dGjjqspTSUqfE6Uo
	 g1kS7RUVv9CBT2x3N+FD77qF4b7vybequPhGNwQVWGbCfjzwG+xVw6oqDhltyZj3uefDQ
	 QH+W7CvLihZrur1C5WAa5ECdtJhIfNaWqTOhUICWfC2LDEVI0PogJ1oky369we2YrYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=a1z2SNtk;
	arc=none smtp.remote-ip=209.85.222.98
Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC616606A680
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC616606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=a1z2SNtk
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so4356103241.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514902; x=1796119702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqravjiiktSzG1I8B6hGi/+VxcvCn0dAKH3YSbgOfQw=;
        b=H3jdM8yPlBOduxKkO5X+wx6fsJY8SKd2JxEmgM4kB+2cj7naS43qyaGmXmWzjLXeT6
         FO5QX6yOUqfPZruzJp2qGfuXuuaznaNCXaCkDexNVf87vnfnjOitiys6vs/eR6Y3WomQ
         Juvc0h5KdrNhrNqewGvKgl01WbBh8QPSsA4XYKKxhEL+O4lJ4ohWC6R4W8ZXFYHFiNeK
         fGyY0idgXMEE2O/TXxd4bgW4AiYZglplF3uX0b/eVnGufYHykmKT3x0M1Fa35RyQ7r5j
         f492HR9owCprXoo1cSWzLU5R8knRgZ55zDw5dKFsL+dF7SdfQQpYC//xMoYgmDRXE2jS
         /V4w==
X-Forwarded-Encrypted: i=1; AL+hErExL1MaKlmXxAX9nrEmKtRHOantpopE6qzlHS60RT4EpnaZWjJs/1BGwt4I72h+iX0LLTZzhZX+rW3wGxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mTS2sDkLabb9WoVB16t37iSToY9v6l5nq4PvhiMWwowulYPo0
	EzmuiDR1xXdsKBtCz9lG25UEFU1AWv4PXRAuTLZatCHNAmAB7R3ET1Egn1RnfMOeSvS94AvASpi
	ZXr5bc69abLK9jcZLbjzWHYo6Rxc7EobRAkqtMNvDMFFr38mMX7uNDbLExhOHrH4DyqfwwoIryF
	eUog4FjlKQwgc04vF2UgSmuFypSPIHeA5c/pZtrovQW9BBFrVV2Z4JEpPFTWdUuuiOlsOVTUgJU
	G6ucrrliFlArl9KH7BCWvakP5rANw==
X-Gm-Gg: AZFdTZf4nw/KBDgIdhAWjgnNLH7oqtYJLT2MklfSYBtwIcA7V/5p+OH1k8WzHnW7At9
	Aqxrn0ArPs1O+cW1YLb27JCqo/JUEgsQzwxGnEKFFDqMHNe/OJvLFlB2mZs1wGcpep0mG/eaigF
	Dlef52/0xit/aj7OIr4TuhVqZzn6Wohwl/N3US43pWbC9sONqUSw8fgw9UC2B9X0zZuSoWlxNY2
	sLQhJgDkp4InGE6ciBq3FkRXT0EP76HkyOjXJclZtw7wK2x6mczNuOBx6aG3sWMg8rem6Tb/OTN
	/lXQUH+q5hVZOAsg7Wx/amAyGnJqol/MFhQust9gth5q4UoOSs3EmNIfi3690ZmReCE92mrbsPQ
	b/wJUYb0bESAqNjAB55FjTx6XayE2gkVpBu+d0nP8mtJHN0GC2zOSaKkGHZU9CeDYYPsppiFbt6
	wIpQwpDKtD5ChDu2IyeXMathLca118TFWDbHUL+IXp3kY=
X-Received: by 2002:a05:6102:b03:b0:7a1:f2b4:dadf with SMTP id ada2fe7eead31-7d7395fc97cmr4572949137.12.1795514902419;
        Tue, 24 Nov 2026 02:08:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d6e8272c53sm113665137.28.2026.11.24.02.08.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:08:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4852676eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795514900; x=1796119700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqravjiiktSzG1I8B6hGi/+VxcvCn0dAKH3YSbgOfQw=;
        b=a1z2SNtkdfZnDF24eVhtO5Yem4AGcDblgtx3inZH/Kd3e8oqAIDx7EBI/oit00hWGI
         kjE7vPmsbqMawmH0oro6oAO0LBlzk+PU3FSoAnuaTrMHX2ZTFQ/LlQ++tk4dWMm7w1Lq
         eaAL8AfNc68XTVmoV9UbjzLNFVbmSdsWrBnDM=
X-Forwarded-Encrypted: i=1; AL+hErFNM1L/W5p+gWF698cP93b1UNM0b+4uZWb8qEbKWnxeMxQM91NK3oMe3ePmsfFsGIbmIKvQijkUYpmcimw=@vger.kernel.org
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr13964154eec.0.1795514900143;
        Tue, 24 Nov 2026 02:08:20 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr13964120eec.0.1795514899472;
        Tue, 24 Nov 2026 02:08:19 -0800 (PST)
Received: from H10-S2 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm49931870eec.26.2026.11.24.02.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:08:19 -0800 (PST)
From: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	bhargava.marreddy@broadcom.com,
	ajit.khaparde@broadcom.com,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [PATCH net-next 1/2] bnge: Add HSI definitions for register dump
Date: Tue, 24 Nov 2026 04:07:50 -0600
Message-ID: <20261124100751.179270-2-ramakrishna.koduri@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
References: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add HSI support for get_regs and get_regs_len ethtool callbacks
to provide register dump support for the BNGE driver. This
includes support for PXP registers, PCIe signal integrity, PCIe
Latency Histogram and Adaptive QoS TX/RX MBUF registers.

Signed-off-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: V.S.Rama Krishna Nemani <vsrama-krishna.nemani@broadcom.com>
---
 include/linux/bnge/hsi.h | 149 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/include/linux/bnge/hsi.h b/include/linux/bnge/hsi.h
index 834db3991691..1bebfc032e47 100644
--- a/include/linux/bnge/hsi.h
+++ b/include/linux/bnge/hsi.h
@@ -12900,4 +12900,153 @@ struct mpc_cmpl_hdr {
 	__le32	opaque;
 };
 
+/* queue_adptv_qos_rx_info (size:960b/120B) */
+struct queue_adptv_qos_rx_info {
+	__le16	rx_shared_pool_cells;
+	__le16	rx_total_cells;
+	u8	rx_cell_size;
+	u8	rx_enabled_cos;
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS7     0x80UL
+	u8	rx_llfc_enabled;
+	u8	rx_pfc_enabled_cos;
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS7     0x80UL
+	__le16	rx_reserved_cells_cos[8];
+	__le16	rx_shared_cells_cos[8];
+	__le16	rx_shared_combined_cells_cos[8];
+	__le16	rx_headroom_cells_cos[8];
+	__le16	rx_headroom_combined_cells_cos[8];
+	u8	rx_shared_pool_index_cos[8];
+	u8	rx_roce_enabled_cos;
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS7     0x80UL
+	u8	unused_0[7];
+	__le16	rx_cos_allocate[8];
+};
+
+/* queue_adptv_qos_tx_info (size:640b/80B) */
+struct queue_adptv_qos_tx_info {
+	__le16	tx_shared_pool_cells;
+	__le16	tx_total_cells;
+	u8	tx_cell_size;
+	u8	tx_enabled_cos;
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS7     0x80UL
+	u8	tx_roce_enabled_cos;
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS7     0x80UL
+	u8	unused_0;
+	__le16	tx_reserved_cells_cos[8];
+	__le16	tx_shared_cells_cos[8];
+	__le16	tx_shared_combined_cells_cos[8];
+	u8	tx_shared_pool_index_cos[8];
+	__le16	tx_cos_allocate[8];
+};
+
+/* hwrm_queue_adptv_qos_rx_qcfg_input (size:256b/32B) */
+struct hwrm_queue_adptv_qos_rx_qcfg_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le64	rx_qcfg_host_addr;
+	__le16	rx_qcfg_size;
+	u8	port_id;
+	u8	flags;
+	#define QUEUE_ADPTV_QOS_RX_QCFG_REQ_FLAGS_COUNTER_MASK     0x1UL
+	u8	unused_0[4];
+};
+
+/* hwrm_queue_adptv_qos_rx_qcfg_output (size:128b/16B) */
+struct hwrm_queue_adptv_qos_rx_qcfg_output {
+	__le16	error_code;
+	__le16	req_type;
+	__le16	seq_id;
+	__le16	resp_len;
+	__le16	rx_qcfg_size;
+	u8	unused_0[5];
+	u8	valid;
+};
+
+/* hwrm_queue_adptv_qos_tx_qcfg_input (size:256b/32B) */
+struct hwrm_queue_adptv_qos_tx_qcfg_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le64	tx_qcfg_host_addr;
+	__le16	tx_qcfg_size;
+	u8	port_id;
+	u8	flags;
+	#define QUEUE_ADPTV_QOS_TX_QCFG_REQ_FLAGS_COUNTER_MASK     0x1UL
+	u8	unused_0[4];
+};
+
+/* hwrm_queue_adptv_qos_tx_qcfg_output (size:128b/16B) */
+struct hwrm_queue_adptv_qos_tx_qcfg_output {
+	__le16	error_code;
+	__le16	req_type;
+	__le16	seq_id;
+	__le16	resp_len;
+	__le16	tx_qcfg_size;
+	u8	unused_0[5];
+	u8	valid;
+};
+
+/* hwrm_dbg_read_direct_input (size:256b/32B) */
+struct hwrm_dbg_read_direct_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le64	host_dest_addr;
+	__le32	read_addr;
+	__le32	read_len32;
+};
+
+/* hwrm_dbg_read_direct_output (size:128b/16B) */
+struct hwrm_dbg_read_direct_output {
+	__le16	error_code;
+	__le16	req_type;
+	__le16	seq_id;
+	__le16	resp_len;
+	__le32	crc32;
+	u8	unused_0[3];
+	u8	valid;
+};
+
 #endif /* _BNGE_HSI_H_ */
-- 
2.52.0


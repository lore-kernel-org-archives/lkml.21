Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599056;
	b=Km+USb9nosuf5+diVIL3Fv/Rfi3PlkSTzJqRWB7WUZDetL3dmTEv7ZWBg+YW3eXDeM9i
	 1oZ1+8daSrEYvpSP6HfsM/9voo4YJDl7hXZvHhVG7HGcpNBUvyVTWI1lkLMlC7SdbZnOj
	 DTpbh+YrOhqdkt0655VIIui9xoZvyyjTsg57COCRfFnwPLs2aB7E85hPuqC0T8bIA51sa
	 uqHAwPniSE+N5EJ9YAT9WjZIIzkGh0fjkKycJe1OHF+vqELl3SoLPf1jw/1RReD8C3Bag
	 rfmkALR+03XlvO4K3fhnsAO4FIcsXXRM3KLpVf9kihTO153WrIokVwVcoe37Z+hSyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I2k/a6mQECX9SJa18m0wd08GRI20x24K3kfWl4JRMIY=;
	b=ZXQQ45HKaJw3GdEIAKPye7rfq9yCcUI96F1pYzpvp75hwlyY4hwh/4yZmXqISQCsXn07
	 44HrX5KJVdGi8EmpfrfdGkjqZPueid0onP5AkCa1swDQQOH5kTtr2rHzEOx0ifgdNNHHG
	 j0E0k/4lv23AImi5GOInXj0arR70uK8DiHxnQciabDVKJBobZG7e1WOvKtlLUM7UZc+fB
	 AhyQwpSCi5zspD1Q25emV4s4FWDqKxGuqCG2gXabjTQ+zsoAIqYgy61K1oCM3TD+ydZyy
	 1arVuG4DB5pNQo6jB1kaJK/kl/UyRKj4lY94Q4H+OYj4tJXY4IsgODswYqusUFOdmXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNWXc6r8;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E558606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E558606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNWXc6r8
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso3740850f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599054; x=1796203854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2k/a6mQECX9SJa18m0wd08GRI20x24K3kfWl4JRMIY=;
        b=YNWXc6r8Tr7pGkQTkgrOwXGti2YSQEYweanEGmmVxaHxG5ojfqnJbZG0bCR8C3eAo7
         YRiN41T5jMnoDCHmBwZCD1pmx+RoHAbsAeJ7zYnDxpPVQsYYiEv1yKYZsYaQO/RSxRD5
         t4huvYenXDx8fLJwmW7BmWkueDVWntqeYQkmOz9udTrjEhUyRPhqbGde7SojZQS/lLez
         EopmoOeJFFu3DIT+PMpbB4g7KCBvpgij8B9iFQ+3ezCb5ZOLfD2HcUHw7/QNqpmXiXzt
         XF01dUkcGQqzzd+/kOkh4HI9++vDoICoyYn0Ytvp5lNBmTdAxnN0rUhCk3/FNrG4UUmK
         CDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599054; x=1796203854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2k/a6mQECX9SJa18m0wd08GRI20x24K3kfWl4JRMIY=;
        b=pzzFtTLDq8cQNNEs4OqV1KngFcvklWBIs5sEmtJIndvMvPlWIO+H3iZHzrwWhrASnv
         8WcoXyphCimnucky/JeJiQvlQLWdPiIJP7oPbU7KIBKslcJaAVSEjEznH5upYbZZERm1
         2lhTWEOrghVHKjthj9sV7YmU5EsuyU9t0ktNNF4LSEucVvGWbpk7E5XGzUaw6kLVqY31
         aAq72qCsYFHdkx+yM/Y//kA3RtmPBBjbulPovu8WK85R+bCg0z1kHQNX/Dffdd/akowy
         qkgP9wIvYVIlGnhp5pjUtpmGgPbZev0doO5qX8xNEMQpyjsAxadS6D7g1aR/vfM51O6Q
         tMnA==
X-Forwarded-Encrypted: i=1; AL+hErFZFWBbxJm5wCZ4ZUmzH91VpFFFjUujZgrneYz8lWQHePdZaqDaWJiX9dYjWhqNBpYNvOlgoU6Z5qeozAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+soXb8uM51jQGuP23s2xgjsxgjQSmOMCmKPPvoLuRPUhumHZTJ
	BnZ79VEqi+feWE3+/nFIfm2rw1aPAua+LJc3MVTM/ec/0xqAqGSeTo9n
X-Gm-Gg: AZFdTZfePMOrwmQ3UyftEo8xYJWxght2uNga1mQSAutQaaR8bnMtBBRFZr6S34LEENi
	eGdwFUmXAfrfjuVMf8v2Z3muvex+VFfK09Nw8M8n43lyWXUJ6ukFu1w1XlZZc/2H3fvbI3feVb6
	pZOXbzP49KMItVeK3/Ge9VKZnUfETMZENAdKZmGbwVDy7mxtdXvL1b9mX5M8ulrFOo25f8PtVM6
	r4ac7elRKxvt2ZA81HyLVVkiMKLjnZbNsC1snBDNbWobTUTnwQCpbae+BNuM6Kh4cK359Tmv0t+
	I+wG+AFzCYvvJ0SegyanuLPXjE+ZzsyIoGm8DCVbZGEDq9Ll33BskDXzIyKo3ERGDQQkyKaHfN9
	DcyqDmUg63bhlHFB2yqM2f415uPl45WnU6rfcZbs+eRPPANHwjd8Rrja+AEAJABUT19Zg4402/x
	A0BATW5EQbihy+2AHQI7PvnmaY36YK6fMN0vFTZe9MrTMCntu6VGH5oZxMc48x7lqZhSwk1jPTo
	0qkOene5x0cog2xswbkG7mvUA8YRseLVdxixO0KcZYm0wHOFPFLTmREQx8/yMJoIJWw47SHm5+r
	UZquoPciyiC7h8RIdIaF
X-Received: by 2002:a5d:64c5:0:b0:490:1395:9b00 with SMTP id ffacd0b85a97d-4aa545e25c0mr40657507f8f.10.1795599054259;
        Wed, 25 Nov 2026 01:30:54 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm32220869f8f.47.2026.11.25.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:30:53 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 6.12] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:30:33 +0700
Message-ID: <20261125093035.224140-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit 59437cbb5781227567dec226aaa88c66a09ccc5a upstream.

This fixes not checking if skb really contains an SCO header otherwise
the code may attempt to access some uninitilized/invalid memory past the
valid skb->data.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
[ Petr: add Fixes tag ]
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 net/bluetooth/hci_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index ff3ccb33da0c..f32473e02c1e 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3905,18 +3905,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 /* SCO data packet */
 static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_sco_hdr *hdr = (void *) skb->data;
+	struct hci_sco_hdr *hdr;
 	struct hci_conn *conn;
 	__u16 handle, flags;
 
-	skb_pull(skb, HCI_SCO_HDR_SIZE);
+	hdr = skb_pull_data(skb, sizeof(*hdr));
+	if (!hdr) {
+		bt_dev_err(hdev, "SCO packet too small");
+		goto drop;
+	}
 
 	handle = __le16_to_cpu(hdr->handle);
 	flags  = hci_flags(handle);
 	handle = hci_handle(handle);
 
-	BT_DBG("%s len %d handle 0x%4.4x flags 0x%4.4x", hdev->name, skb->len,
-	       handle, flags);
+	bt_dev_dbg(hdev, "len %d handle 0x%4.4x flags 0x%4.4x", skb->len,
+		   handle, flags);
 
 	hdev->stat.sco_rx++;
 
@@ -3934,6 +3938,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 				       handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0

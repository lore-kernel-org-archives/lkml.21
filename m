Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.184.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769357;
	b=ywKybWEtMfWAnLQiDGx/ZVItdLWFatCwA51W8I1HFNDnIAPaR6ql1IUQwLpSUgRIF/4W
	 EiT32dhkcRhQYoGnmDiBO6RpEtePyaNjCOupvVOThgTYapW1zKH7Dmk92wxFNxdRGSWL2
	 zgR20Wb2NqyyYtjyfK6XNZ7HkWBGK8r30iA1AV60w8h8kGSMaHGXntvKA+8BekaOxOmtw
	 BwNPTxb6hCHDfA04oK6uuqQv4WV5t/RhfaMt88UypxCbgHjmGxXw/bs1fmLa3MfkPLbNx
	 6XOZqvjkPLiPgDIxhkFlYX/KGrPP4tjx1dGaQOe/96n0+YFwN6Q7YWJa3csIJMBJYQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769357;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=Qpg3+IyjjXZz8rn5Pmt07Gcef7W6fRnRi3A9mUqgmMM=;
	b=0toLVk+G6KhtvqXjm8mdTF+mQzoaiBq3YZK3SfW1qofcW971+i3+FPHdfhFvacOaFEMN
	 j1aaNVrof+BtFuIXFRkv9p2Vz061h8waPlbP1abHD1YhgvB3nhXNjJ8/RbYpxdlWCS/AY
	 geriyG5EUaoL9FQ7tdUZqWYmIgAC+lZzzBs8+YN87WC01KCeKnr6JeOYqiHQbPwH0d5bt
	 3MKYjDQNgrODKQAdt603gBvxiEGUMuy05cjBjL4MSyLuoneKhbKXlx+ewzm5IqaSP0aiV
	 Ld8MJXNch0j6MRHGS4t9gmdYUyNPQi0pmUH5MxRj7TZWT+8E7qcAXHGyt67vGKxpmBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=NXqOf0Z2;
	arc=none smtp.remote-ip=87.98.184.141
Received: from 9.mo561.mail-out.ovh.net (9.mo561.mail-out.ovh.net [87.98.184.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC2606A686
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FC2606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=NXqOf0Z2
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.249.19])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4jbRt10jhsz5wK9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:13 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-bntqx (unknown [10.110.113.124])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4E30DC2A2E;
	Fri, 27 Nov 2026 08:49:12 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-bntqx with ESMTPSA
	id 3zMOCghECWtv1hQAXudyjw
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 08:49:12 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0043b4fcad2-0187-42ff-8b59-53cbb559db0c,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v4 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 27 Nov 2026 09:49:07 +0100
Message-ID: <20261127084910.3355833-1-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4902449670733361135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTERgDH1wtn2aQmW7u1TE/Z35QbX8WazV7XieAr+Pb2q4d/9+I6TFTI+j9AVTXESVjomi7I+kQ9mS9nZE9uqjCE9yphG0p3wcBVKfhqP3OUm8dXZ4BGeKjUig6mnzEAiEbuR2vY3Eu54diMRxqGBikb1VD2nVtw2ZcURh5uJRmiiAzph08vl7W1Pnxq/bUpoQi7F1SRUxbXRBTTRu3TpsIlcNBWFkbO0uGuXQ3+/cp6bZmzW2/tGWf6EbMbJh6G1xGz0BC0HAqLS6iuqUkRClqBU19jqxQRMxZ5RIaWvBbZ03CZavGOgO/WEjjQK2RLvcx6itTPCHl1GhLRCc5bFJfVNJBSp/c2NPCrYVkVWZkXTPQtU/JdYBvnxCsVrxonrs1538kIsbkUn0YaLxKMomKIHEbadJzetFOys6+xaqvlfTOVt8XZfxmoCTF5Bx0j9qAuq68jEP7Tz4tVQ5ljnnvDh3A0hJ+9W1u6qmjE1mR5WBugNfspKRthl+c7xWzJD/bq5AEfcV5544TSFAB+4/EiY8JumaGo/VzHIdLQgbJn97PLqgktZ6Diyl1PNYEitpBOfk0GYnUutLlpcG6IVavdkbb2uKJ9ZkuoJj3JmJfXqF/FgB8O3nMkP39yEvBdpfxehdSdxwgUbfqzmzWo/Qy8FCNTVkcFc+7e7D0a1H1oFQw
DKIM-Signature: a=rsa-sha256; bh=Qpg3+IyjjXZz8rn5Pmt07Gcef7W6fRnRi3A9mUqgmMM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795769353; v=1;
 b=NXqOf0Z2tPP4KviMZ/urBeTjGPTwQ8GLVD1HDQof+wzIkIdbrL0m0ry8ltQsRxMaoftOCYB2
 3qH+84ykqquiDYGvP7DcS92F8TceE0PBdNTPOCJ5EZY4pbv7TXoGN+BRiDtwOcKaJKdyDKOc8P6
 MZM5tpvgIhCpOoo9nL9zg4VOfM3axay9q/b5nmFjvhFWPDM7DnAlB06A7J4QW8UKEU0kJm2OO+P
 XbWg4QjMCxHtlSdi3oi3+4U9Erq6lwDChDpJGeEXEMeefi3UqJUN3nx8sxyXC3EXTYUjSJPuxi1
 ikOOGRWEWeSry1zDtEtECUZidcEE3HL1TKU7NH0xHAMGQ==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Link to v1: https://lore.kernel.org/platform-driver-x86/20261113074347.2301465-1-filip.golas@3mdeb.com/
Link to v2: https://lore.kernel.org/platform-driver-x86/20261123105821.305527-4-filip.golas@3mdeb.com/
Link to v3: https://lore.kernel.org/all/20261127074518.3244152-4-filip.golas@3mdeb.com/

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 413 +++++++++++++++++++++++++---
 1 file changed, 375 insertions(+), 38 deletions(-)

-- 
2.56.0


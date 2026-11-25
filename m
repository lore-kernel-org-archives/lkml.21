Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604634;
	b=exLaaXMTd0uhalujbHaFbtdvydIzzQYWs5xKZSp/BwViv/5OK6+jz8GbG5v4JWiah4rX
	 0L6zG3lCbAWoGcB4Hc2WSjR+XvQb6Qatq0popd1XQ/G9mDPa/XE0XVwprmF/B8nJwfxEo
	 fWJlkFMw2d5SpsTWbikhFtahhbN+tw359N12Ess4TBgV+a7bygs/dSR4BZvOQ1g9VE7bk
	 QH47Lu7nQ+wxwxFfFnVXTUklt40/tzxrxF0ziBf9yXSWc/OseJgZbm/emOXSadMsC00gC
	 fVfoNs4DFu+SjWo1BVolItZt9Eac6V/dpts5W28gFl8wRdXvmrEpFoNpIFjrCUALDfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0kNQWd4xFKVKn6MSVwE1lsRc4X4V5piL50Xtk3okz4Q=;
	b=zQkR4t1lnOte7SfSV+Z4RxUGPSs82wvtV6NicHVPAzxVGPhFOEOALCZ7fXOgl4yMuUIj
	 g8Rejp3y1lEOyQjuEABIzBDcWGtyIWCf56BfshKJ4U41FzGq7M0CwhASuAJpZqzCeLtSI
	 zrI6mIYQfuueox1gQQk6eEiPabLYBXzMLm3bjXW8jweolQV+LparBP0P76B/J5gZCpnge
	 kY9YFuKWrQfq/X/SdB2RyZJgrmk5n9eZPv3/P+UurKj97++czA3X8MlVK8Pv89QZak9Uh
	 00x90qaI+4kKc7r0dVZPEwc+eDpDlODV1sK9mGVSZS3qN1KyDaYmXeK3RA+09+U8XvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEJETcDI;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92688606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92688606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEJETcDI
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38431138772so7248385eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604634; x=1796209434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kNQWd4xFKVKn6MSVwE1lsRc4X4V5piL50Xtk3okz4Q=;
        b=tEJETcDI9nkCss/hKuXkAaC9GvIz08tJYkSrVU4Oe69bDT0B66YUaL+J69XjRnBVMD
         Ahp9NLL1bEKf6C9NL6GGrrzrPU2zSHu3En0rsnhcf2usHpCDfyQWDyHFUGUQlLEetzte
         /fgEt8ue46CS7/fi9c0QHCJ1zMmjpviN/o83uV9sIDP38eWQ+NO+kU0id6Gt41JKOQUs
         1KurRA9D8cpc2/QU2eRf5F66A6AJ7/9niMKrjpiIg8pxK28Mg+Vbkx9/7HjPtkDqX+xO
         C7i8OI7DcesHsNNnD+jgPDxNijanItWp8h0zKHYWDgHGLxptDPhsIfMFCd+PZCDXAwUR
         ZnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604634; x=1796209434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kNQWd4xFKVKn6MSVwE1lsRc4X4V5piL50Xtk3okz4Q=;
        b=WP1lP9R9KZHfWHVgOuRly29Q/qenLVwhgG1/7xO6UUFKslXkOOOCB+ns0Ro9hGEmbw
         RNazH4Bplr/hB5Sd0y6m7cMV4yRun1YReMkAaqwAm1K/tJ6+r+imMYI4SaV66HF25EXI
         RpjzpEsJzIiIEUW3GzICQK4OC7JWnf2l0vwmRUo1KyR1E2XRfyhamFOpfzbNQ0nzNDRN
         DNi33eF1yDzr2Wgv370x8U4skSwuqtFpR+GVZOtPjkLguNnyuQWkMYzmc9dAHDe0dbdM
         M2igSOZhzn23NJBaRCdseNUrW1ppbBo4+KSLjVn5++8wiZFPbRcCpM72tO/br55b4hbg
         DIRg==
X-Forwarded-Encrypted: i=1; AL+hErHrmiV9rCrZjOiuckp/+bHw+DK5LZ780o9NImmruxcnpP3UqamszKgjEwGZBkDbftaI2wlMqUjbBOlfziE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CudrBlHzC7tJPGYVI6SBcdCymu9cqplYOD93P2fBuXeMTkbZ/
	uk8lZeGWA6EiTPiRRmC1dZh5y5waR6G90tSnZMpNJkZzienyODnrJ4r8
X-Gm-Gg: AZFdTZcZidzjw2iAEKg3kmicfox0pgev3GXrmKUhOvkqJRXBq7mQRdeHOyojen4qE4Q
	oCsDbCmPZiX03egJg3+OMQxovYCNYLjB6NAQBFvYEPiZ181VVN6gZD6FYlh1UnpnY9oAGHudDuu
	uCRIvQacxon58SmSxfvKmTAGCt/sLCq8WwZhr7qQNqKahBFgDe7hFulLEgk05wJ2UVBZREZR7gr
	38FUZldPZH2o/21XbBf6abFd8Q/d2TAlGI3+3EhVyuTJuvimHT0epsbnPX0Z2CUbrLp91bRLTlr
	gTRQ38Oxpd7U+4HNh2HCujlPMLlBM7QkF1Wj8jiWm0Q2rek7p9Y0WvYhHSebcFGyl510Q+5728k
	AqsDWDtXW+HUrDQKXF+s/MQ6gF0Rnz/rWeCb89GBuP2bJE/CtWZOYJNpd1dI+fgOki3i9igZpx9
	aq58/4mCEQdRqWcJ+OjrMgGfyWtrbfhDhKqOdujAIIVcGhBa7HH7nlOFJAIV57IjWkoqdCgSP3b
	ZyI8No/w9iLZZkbvivtfKbT+JDmHMdbaLT/apDFRRr/WDBCgKkppcyykvy9YmuI8XLthnl4PG0u
	npsST6XW2RJLZDNz1zqU2ofL8A4ljczk5ZsNr6cHznz7HUK7be/N17KyNK+xSwrLUNWhrknU2w=
	=
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr16085568eec.23.1795604633460;
        Wed, 25 Nov 2026 03:03:53 -0800 (PST)
Received: from BenDellReactive ([117.20.154.221])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm49317327eec.13.2026.11.25.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:03:52 -0800 (PST)
From: Benjamin Dornel <benjamindornel@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Dornel <benjamindornel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: iwlwifi: mld: fix net-detect wakeup report after kzalloc_flex()
Date: Wed, 25 Nov 2026 19:03:47 +0800
Message-ID: <20261125110347.884775-1-benjamindornel@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Since commit 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj
for non-scalar types"), the net-detect wakeup info and its matches are
allocated with kzalloc_flex(). Both flexible arrays are annotated with
__counted_by(), so on compilers that support __builtin_counted_by_ref()
(clang >= 19, gcc >= 15) kzalloc_flex() also sets the counters,
n_matches and n_channels, to the allocated sizes.

iwl_mld_set_netdetect_info() still uses those counters as the next free
index, so every match and channel is written past the end of its
allocation, matches[0..n-1] are left NULL, and the counters end up
doubled. cfg80211_net_detect_results() then dereferences matches[0] on
every net-detect wakeup that reports a match:

  Oops: general protection fault, kernel NULL pointer dereference 0x20
  RIP: 0010:cfg80211_report_wowlan_wakeup+0x46a/0x680 [cfg80211]
  Call Trace:
   iwl_mld_wowlan_resume+0x9d9/0xe40 [iwlmld]
   iwl_mld_resume+0x1d/0x50 [iwlmld]
  Workqueue: async async_run_entry_fn

(0x20 is the offset of ssid.ssid_len in struct cfg80211_wowlan_nd_match.)
Without panic_on_oops the machine is left wedged mid-resume.

Fill both arrays using local indices and store the number of entries
actually filled in, as iwlmvm already does. Also stop setting a match's
channels when they can't be reported, rather than leaving n_channels at
the allocated size, and report the matches found so far if an
allocation fails instead of returning with n_matches unset.

Seen on an Intel BE200 (iwlmld) in a Dell Pro 14 Plus with kernel 7.3.5
built with clang 23, with net-detect armed via
"iw phy phy0 wowlan enable net-detect interval 10000 matches ssid <ssid>"
and that SSID in range during s2idle (also with pm_test=devices). With
this change the same setup reports the match and resumes normally.

Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Dornel <benjamindornel@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/d3.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/d3.c b/drivers/net/wireless/intel/iwlwifi/mld/d3.c
index 77e4850..e67a22a 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/d3.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/d3.c
@@ -1423,11 +1423,11 @@ iwl_mld_set_netdetect_info(struct iwl_mld *mld,
 			   struct iwl_mld_netdetect_res *netdetect_res,
 			   unsigned long matched_profiles)
 {
-	int i;
+	int i, n_matches = 0;
 
 	for_each_set_bit(i, &matched_profiles, netdetect_cfg->n_match_sets) {
 		struct cfg80211_wowlan_nd_match *match;
-		int idx, j, n_channels = 0;
+		int idx, j, n_channels = 0, n_set = 0;
 		struct iwl_scan_offload_profile_match *matches =
 			(void *)netdetect_res->matches;
 
@@ -1436,10 +1436,9 @@ iwl_mld_set_netdetect_info(struct iwl_mld *mld,
 				hweight8(matches[i].matching_channels[k]);
 		match = kzalloc_flex(*match, channels, n_channels);
 		if (!match)
-			return;
+			break;
 
-		netdetect_info->matches[netdetect_info->n_matches] = match;
-		netdetect_info->n_matches++;
+		netdetect_info->matches[n_matches++] = match;
 
 		/* We inverted the order of the SSIDs in the scan
 		 * request, so invert the index here.
@@ -1451,17 +1450,21 @@ iwl_mld_set_netdetect_info(struct iwl_mld *mld,
 		       netdetect_cfg->match_sets[idx].ssid.ssid,
 		       match->ssid.ssid_len);
 
-		if (netdetect_cfg->n_channels < n_channels)
+		if (netdetect_cfg->n_channels < n_channels) {
+			match->n_channels = 0;
 			continue;
+		}
 
 		for_each_set_bit(j,
 				 (unsigned long *)&matches[i].matching_channels[0],
 				 sizeof(matches[i].matching_channels)) {
-			match->channels[match->n_channels] =
+			match->channels[n_set++] =
 				netdetect_cfg->channels[j]->center_freq;
-			match->n_channels++;
 		}
+		match->n_channels = n_set;
 	}
+
+	netdetect_info->n_matches = n_matches;
 }
 
 static void
-- 
2.56.1


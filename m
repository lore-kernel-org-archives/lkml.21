Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795230609;
	b=LXcIT9VmFCPqIA/UvQd9F+kD+v2aYdH1LsNz47kypYYnBMMKAoChbly7kZTXppVNuz/r
	 cbg7RxX+jdhx5pKa2ySUUMoXYU2VOehJUS3GjjsmlH9P48uq3HBtJh/D/wv7L/73uLErs
	 BEXEOjzPCOc6y3MlTRqT56a8AIkG3UkdsfgF6MOdn5p13MlvzZ0Q7k8flOuYYdzIgyYNU
	 op2mOisgRp80PSRfW8xKes0Xsx7mld/DW0bD2Mkc7TV6ARuMevg76ISEIwS2HpnMXqSxc
	 MfCUEBcxNrj806FzFyXkz7da97AyGPaHeNKJCB0GPAKFhDjVIIbcwIq4Mtff7AeiugA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795230609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kk0j6F4u8RyOwIi48XCNaJybmEVI2lLpJDiNK74Ze0s=;
	b=4QoyY27LuX1hb+2a7DLdPe2F7vphGY5j1FtgkXx5YxmiGQPfkTK8X5uOZjxU48sKlHFf
	 +OEnRMEtPZTXSMYoB/a8neBJnMmW/spuX3YjBfqZeHLXpvxyF2ea9ylh2QsxvSVde61SR
	 jRLxl5G/M1j4Qr4ty7jX9sCCXJk1YgfD6WsX3FwHaSCs0On0ofIJCOYbT90eKKmfKi7av
	 2Qp9uxTR8dYy8tyw5lxYwUOnTShpLEaU6OwviEw/l5t98sfHhobvsRBpsjsNbsqoC9Pak
	 16IgfEyqVn9qjOs/+jO0QPHOd4f4M1qiiXQt6j31TOja7YlP7Nl2JU4K1iF3+hapP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsnBmaIa;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37117606A689
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37117606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsnBmaIa
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so2290824c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795230601; x=1795835401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kk0j6F4u8RyOwIi48XCNaJybmEVI2lLpJDiNK74Ze0s=;
        b=KsnBmaIaRGc5OUE0Ft0dc+1GePSOdQ5k+IWHdHyRvwT9Hhhw3KaJXrW/fuTQc2vod2
         EZsCawxL7ZSvd74RNTzC5GL7VbiOx1NyW7Xjbu5pcmQT1l3kf1fp6q1G7lYISYKGxMwW
         GhTvpmmh9Y4Jxi/PwD6MHfjdwHYJWZqcbKoxuRXmPiVvqnzl/TR6Vx+VR8XByUUIBUxK
         2LOkMW3qRDol7f4xv38JQUMjO1HqwsmfvGEO687iku6fz/T0kpZO9q6+5JjP35fkgEMD
         csc/JxIw38NXVMZF3xyhuvc7PMZCuMPUw6ZXXk24RlqbOO9DCxZITpAHdaFApv6LXYzK
         2yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795230601; x=1795835401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kk0j6F4u8RyOwIi48XCNaJybmEVI2lLpJDiNK74Ze0s=;
        b=d/G1ICDe+Mh2dQAnWOPCpgwjKJ3MTXrGeXEOFafyO8cHGV7xSSEAwEb+Ck3k4+x/jQ
         W6XIp5m3mwdr7ewo+mI3iCLdlnxON26PjkI0CKzcfBoDuBjjRc/tOAw/NOMoHTVI84DV
         J+fJbUwijoq1veQJj2qPAgypOH65eV5N4uaYefCKILHhy/uD69Nr5fW7Jgn3gg25iBqZ
         QlgMoLziz2wh9XJyUj/dpD11/2eQmBvma7Q8pBuseDfJRS4Wy4p1VLBoJD1WZzsGzioc
         adPJmSoqRljtQyoxTdrRNPYlUuu+yZpl6JfIG8+KJj6jxlWAwGRJUzfpAKWBdzMyOHXq
         bJEg==
X-Forwarded-Encrypted: i=1; AL+hErHNzLrYjJxOF27s50PbYaYwyCdDpXYYzLIDSnUnQGA+WtrQR1eSfNLqHRH3K3XsAQsZp/+/PkXHoobkdOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SzLsgoxphPxZvi7OBmPcQCtRUws6DYla+CXUvis96+G9QdNYX
	VgrmYsL9VuhutvkSs0/TNleJEPZJeeUqoDljAahlrtxpwglZ1ETTYXD/
X-Gm-Gg: AZFdTZeJkMVJC7btCIuA00+RhuuwICfrsqh9vN8SsYX9PlOTRZc7r18E+lnk/aUuJWd
	H4gX3+8B0+uA+aN1y5vCeQ1pQO+/WVgS0iduffgc1iJKm5KNz6emd3SPDt5qT9OllS6+UGPcTzt
	/i3laYRHzNNxnI//I4cWEUgcnVEokG50sQ6ir9EGHkK7Hr11CCbspbH6tPTsdOsTfnu8tLPwble
	guyHmBwLg1bBoPXUl62QP7t5dsMEfYGIrY7DuIUWl9PlJHXE5tBCJHr/CrG/SFyjuQ9nUsXYdEb
	LAiba7rZEHW528S5Ds85GPGKIk33Am2zbra3iSN1ufuYQ87JcoPaUwy/OWaYarBWmK1CThMJrxI
	7dlWrYh+0aWecO41LVE3hPl/+D09zg83pNqPAWGiRMqipVCcZVOqzIURyk6UX9f4YH/XGxNgvuW
	ZwJATpbzFvyBYqQObhqQF5Wbn1EgdRYw79aeotMJ+4XN/LuB2cmgn8BWMoVhqeL1CCW00gZjil1
	ZO0qFsdFRRwXQsSP+54Ezcj+yjsLBcZqhxxzUsnlavVTcIV0G/w+cSTIqAUmw2BEx9n21Ar6232
	+YqxaHvw/QhPPm6uZoEOVRgOyowtNw+VGJnvI53GL164T/Iu1hOtGVGA8LvBFen4MUHOsvdl
X-Received: by 2002:a05:7301:6285:b0:369:f182:8e99 with SMTP id 5a478bee46e88-38570554684mr5874137eec.35.1795230601058;
        Fri, 20 Nov 2026 19:10:01 -0800 (PST)
Received: from fred-server.tail1cd3ef.ts.net ([2600:381:4c20:1067::7ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm15806890eec.5.2026.11.20.19.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:10:00 -0800 (PST)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] smb: client: convert DFS prefix from cache charset on reconnect
Date: Sat, 21 Nov 2026 03:09:51 +0000
Message-ID: <20261121030951.1470502-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The DFS referral cache stores paths and target strings in UTF-8
(cache_cp), whereas cifs_sb->prepath must be encoded in the mount's
local charset (cifs_sb->local_nls).

When reconnecting a DFS link in tree_connect_dfs_target(),
dfs_cache_get_tgt_share() returns @prefix in cache_cp, which was
passed directly to cifs_update_super_prepath(). On mounts using a
non-UTF-8 iocharset such as iso8859-1, this overwrites
cifs_sb->prepath with UTF-8 bytes. Subsequent operations then
re-encode cifs_sb->prepath to UTF-16LE using cifs_sb->local_nls,
corrupting non-ASCII characters on the wire and causing lookups to
fail with -ENOENT.

Add dfs_cache_local_path() to convert a path from cache_cp to a
caller-specified codepage via UTF-16, and use it in a new
set_super_prepath_from_cache() helper called by
tree_connect_dfs_target() so cifs_sb->prepath stays in
cifs_sb->local_nls across reconnects.

Tested against Samba with iocharset=utf8 and iocharset=iso8859-1
across multiple smbd restarts.

Fixes: c870a8e70e68 ("cifs: handle different charsets in dfs cache")
Cc: stable@vger.kernel.org
Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
---
 fs/smb/client/dfs.c       | 18 +++++++++++++++++-
 fs/smb/client/dfs_cache.c | 31 +++++++++++++++++++++++++++++++
 fs/smb/client/dfs_cache.h |  1 +
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/dfs.c b/fs/smb/client/dfs.c
index 788cdda9a573..efef00c33321 100644
--- a/fs/smb/client/dfs.c
+++ b/fs/smb/client/dfs.c
@@ -404,6 +404,22 @@ static int target_share_matches_server(struct TCP_Server_Info *server, char *sha
 	return rc;
 }
 
+/* @prefix is in the DFS cache charset, the superblock prefix in the mount charset */
+static int set_super_prepath_from_cache(struct cifs_sb_info *cifs_sb, const char *prefix)
+{
+	char *lprefix = NULL;
+	int rc;
+
+	if (prefix && *prefix) {
+		lprefix = dfs_cache_local_path(prefix, cifs_sb->local_nls);
+		if (IS_ERR(lprefix))
+			return PTR_ERR(lprefix);
+	}
+	rc = cifs_update_super_prepath(cifs_sb, lprefix);
+	kfree(lprefix);
+	return rc;
+}
+
 static int tree_connect_dfs_target(const unsigned int xid,
 				   struct cifs_tcon *tcon,
 				   struct cifs_sb_info *cifs_sb,
@@ -444,7 +460,7 @@ static int tree_connect_dfs_target(const unsigned int xid,
 		rc = ops->tree_connect(xid, tcon->ses, tree,
 				       tcon);
 		if (islink && !rc && cifs_sb)
-			rc = cifs_update_super_prepath(cifs_sb, prefix);
+			rc = set_super_prepath_from_cache(cifs_sb, prefix);
 		break;
 	}
 
diff --git a/fs/smb/client/dfs_cache.c b/fs/smb/client/dfs_cache.c
index 02864f7acefc..168f563d5ef6 100644
--- a/fs/smb/client/dfs_cache.c
+++ b/fs/smb/client/dfs_cache.c
@@ -105,6 +105,37 @@ char *dfs_cache_canonical_path(const char *path, const struct nls_table *cp, int
 	return npath;
 }
 
+/**
+ * dfs_cache_local_path - convert a path from the DFS cache charset
+ *
+ * @path: path in the DFS cache charset
+ * @cp: codepage to convert to
+ *
+ * Return the converted path, which the caller must free, or an error pointer.
+ */
+char *dfs_cache_local_path(const char *path, const struct nls_table *cp)
+{
+	char *tmp, *npath;
+	int plen = 0;
+
+	if (!path || !cp || unlikely(!cache_cp))
+		return ERR_PTR(-EINVAL);
+
+	if (!strcmp(cp->charset, cache_cp->charset)) {
+		npath = kstrdup(path, GFP_KERNEL);
+		return npath ?: ERR_PTR(-ENOMEM);
+	}
+
+	tmp = (char *)cifs_strndup_to_utf16(path, strlen(path), &plen,
+					    cache_cp, NO_MAP_UNI_RSVD);
+	if (!tmp)
+		return ERR_PTR(-ENOMEM);
+
+	npath = cifs_strndup_from_utf16(tmp, plen, true, cp);
+	kfree(tmp);
+	return npath ?: ERR_PTR(-ENOMEM);
+}
+
 static inline bool cache_entry_expired(const struct cache_entry *ce)
 {
 	struct timespec64 ts;
diff --git a/fs/smb/client/dfs_cache.h b/fs/smb/client/dfs_cache.h
index c99dc3546c70..636eb1554311 100644
--- a/fs/smb/client/dfs_cache.h
+++ b/fs/smb/client/dfs_cache.h
@@ -53,6 +53,7 @@ int dfs_cache_get_tgt_share(char *path,
 			    char **share, char **prefix);
 char *dfs_cache_canonical_path(const char *path, const struct nls_table *cp,
 			       int remap);
+char *dfs_cache_local_path(const char *path, const struct nls_table *cp);
 int dfs_cache_remount_fs(struct cifs_sb_info *cifs_sb);
 void dfs_cache_refresh(struct work_struct *work);
 
-- 
2.53.0


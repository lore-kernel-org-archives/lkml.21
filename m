Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945284;
	b=qd86mWQFeTiAPKNbTTx3TkHQaaR5vyW5UTkgFZYa0OodtAvqFVPiHq8ys8dZChy6ITyY
	 M9P/vQLtemODPcjGpjUGxZ+IBL0f1UipGxHWCg3A6UoJjb3gF/pgeq00aX5fytRkPppx5
	 miOLTvoIGajceWGCxepOZNLYYCZMxwIjwDnYdcqYnkGSq1DzvJsJqb1M6457CiPchUCWF
	 QG+N0NvpRhpP/znBKRnuG9ZhYee6ZY5un+PVWH4QwjhUaUnDwWtUn0Y9Nv+yxlyrM5mLf
	 1q8HJUKYnlApqzCMUINuw1jp8Fd1kSWL3Ea04LdkDzFCVuhFrLEeBjYoK+3PYToVXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UgyoOlhtAXFcRqYIBOM2SsXiIxJADqweX4syv/IHfy8=;
	b=1mY3YnjVZD23YJiDMqWddzQ0+60nVbHLwcteCpHx4j/CVX8s9gFPdkXF5GeVQvRd+Xau
	 5w+PJiMMWfF1V+KcEwzuFizvXAUNm7d9z1oouR8oejFQDMbjeZvJ+pPBlUCg7j6G9jbhO
	 UBD1QDWpgzD/KzCeAA9RBQ8rpK4CfqPIa1BVo/kI0pKjLEsHD9VJeeODXFugt8j0Rog1i
	 dDxBYt3lI5jxrGu6heh29nc5Y47yj8u600Z9bl/xUw1sv6iaBtDVzNSAEDPdqSYWI7ig5
	 IBUFJ52Qx/tBEAyB4iajEZX/iqMuNvz9c7XXcSwonR9ZTwsMUWllagVEeUqcU1bHCUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PsPV0FbS;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C3D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PsPV0FbS
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9495f083657so29914785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794945282; x=1795550082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgyoOlhtAXFcRqYIBOM2SsXiIxJADqweX4syv/IHfy8=;
        b=PsPV0FbSoH3EBsZAiDqYx4piVy+a+VsdVn6lf6uYuC61CddilVAm/78NvIF1l8cu3j
         S9qkOZL8tbETOSF7/qX+O680lu7hbbfkK5ISAJj9KOsOEchkMxGBFySEip1YZiERAe9v
         fcqt18LHLcmcHL0YV1hR3MMkyQCGl7Pd/1ESR4EguCNCCTrNMbIWmIyoeC8ZnIFhhGJt
         OUUy+0ba4BDG6RslNg6Oupl3qrOMEWAEpFYdS0S2K/xG2sZmjm7CO8YlqvRlsGltba8w
         FHz+pmlsC1HBGfLfpREe5NPXm5AIX+O3Hja89UZocTvp5DX4cWWo4NpnMibrp2qVJwfY
         5ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945282; x=1795550082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgyoOlhtAXFcRqYIBOM2SsXiIxJADqweX4syv/IHfy8=;
        b=ev4MT3PgtA0SAeVS+ufOcMmBizVFOwEv/1mFo2+pW3JniwDVQhKx7eTScpJ0uSOADh
         Y9F4swOLX7guTU2OX+kwPhd930XYHyqFu1vRDYPv5BuGS+mJPxBCH1FGW6kk4Ur+MvrK
         xDnmkewb9vJw+MDSUM07rkQZWL5F+ZVxIBLCTE5ITm7KsHwS/GEoRGRzzsyjUCk2XqHm
         0IgbKUCEd2mt2UHq5B7uu2gUjSeTEuMpHkd56M3OLFYf1J/GWXgKiEPf50wv25gULFSO
         ++h/Ck25J0kVYZA/kwwp3PaHq0kP5bW7u4YM+nnCcUjr/CU1XV1fY2nGMPCC39OfHZLX
         sV+A==
X-Forwarded-Encrypted: i=1; AL+hErFoZ698DxoqiOIYlhTO9W1lfH91qAnDyWp6wV3Fl4IljXZ64Ofnj0gQdgniv/Y0amqNdlaT3lyptvtm+Ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z99j1xvjrtAbZ//HiC7E0Du/08/U4uCYlmdqX6OSBVwE0e6ssUR
	ggGBp0h9mDlZapcC0H0yapMJ3FT7Gfn1/KmQ8xw0fn9rkW2Qf2uTM2MpndH0i/qWveEWDTFiAT4
	e8Gfr9I0=
X-Gm-Gg: AYBFou1RiVblksWu6di1f4S0G+2x40uwO/z9gwTDIagOAusfy08GEqjqV2I51OlJTrA
	s2YiVygJ8mfETXtnpWVoYK+wtRsj2AZlyDOKrmswJNUScOBR6GJlAc/xsREQKUApAJ/9cNv4POV
	8JtzyFAf0dTTDqsNUuQ/zfk0qBRO0wtrxe5aAPSr6W6hOAgQGFYlGS6/C3m4qWYUxs9GQpb5l6L
	C9cUYjb/arUy5uDQYAZg4lt+ZPyZuPgc5iFFFntPDIO3QtL5GBKOJgF96jQXX8JLceU88TVelP7
	qeP2pDF6uTPZa+8rts8EVVL5bglUYCDjmiQ30jmxnn5Gawz4dYwqZNT1GqLqGS9SE77bWcvswZl
	a/OFnZVQ4Mzavwy1DLlxkmikTqfDKMICgoGiEV8WVf040twhHcrhT1xECmA4T6wvI02uDS1jvnD
	TE/bjLkz2gUUfX8JIDmsYHD/xrrTcT/XwuUNoUnH+CnOC9GY+gGihe2AIA9TeUtJqy/+knbu1ss
	BSWELEczhMav5C6EJVzQAH0FDaktCK/WhkPDnWyOkDIx0OzT4OloZHLTmHm8McMG4y3+P/45UfF
	gxPwkWaK2+SAXaHo5amhgVb9HeMt4Lt/rHaMlbwm7zn7GXU=
X-Received: by 2002:a05:620a:aa1a:b0:93e:7944:b869 with SMTP id af79cd13be357-9499a2e5dfamr57612185a.42.1794945281909;
        Tue, 17 Nov 2026 11:54:41 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b2892a2sm11834385a.0.2026.11.17.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:54:41 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 17 Nov 2026 19:54:24 +0000
Subject: [PATCH v11 1/3] userns: don't let setns() lend CAP_SETFCAP
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
Message-Id: <20261117-b4-setfcap-userns-v11-1-2be11a2c32f4@toxicpanda.com>
References: <20261117-b4-setfcap-userns-v11-0-2be11a2c32f4@toxicpanda.com>
In-Reply-To: <20261117-b4-setfcap-userns-v11-0-2be11a2c32f4@toxicpanda.com>
To: Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Andrew G. Morgan" <morgan@kernel.org>, 
 Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, Bradley Morgan <brads@mainlining.org>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794945277; l=6359;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=32+LoADG6QT10HmGwykW7egT/CwzPpWpVKUua9+0wRk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGHyA+cL3OHHNMTJIX4UjUCtWID8KWQNCgUe9H/GKWCwJN5/vCEuCpeOxaF9ET3I/VTjk6W6sRU
 BS5KoVSvyuA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A uid 0 task that gave up CAP_SETFCAP can get it back by joining a user
namespace that another root task created.  Commit db2e718a4798
("capabilities: require CAP_SETFCAP to map uid 0") keeps such a task
from mapping uid 0 into a namespace it creates itself, because tasks in
that namespace could then write file capabilities for its root user.
setns() gives a joiner a full capability set in the namespace too, so
it can do the same there:

  task A: uid 0, full caps          task B: uid 0, no CAP_SETFCAP
  unshare(CLONE_NEWUSER)
                                    setns(A's user ns)
                                      allowed, euid == ns->owner
                                    write "0 0 1" to /proc/self/uid_map
                                      A had CAP_SETFCAP -> allowed

If A's namespace already maps host uid 0, at any uid, B can set
security.capability on a file right away.  Either way uid 1000 can then
run that file with CAP_SYS_ADMIN, which the selftest at the end of this
series shows on an unmodified kernel.

The check doesn't look at the joiner's uids, which it can change while
keeping its other capabilities, and CAP_SYS_PTRACE doesn't stand in for
CAP_SETFCAP.  What gets refused is a task without CAP_SETFCAP that has
CAP_SYS_ADMIN over a namespace that maps the joiner's root user, or that
has no uid_map yet while its parent maps that root user, so that it can
still be mapped.  If that is uid 0 of the parent and the creator of the
namespace didn't have CAP_SETFCAP, the join is let through: only a
writer with CAP_SETFCAP in the parent could map it then.  Containers
that don't map the joiner's root user, tasks with CAP_SETFCAP and
unprivileged users are not affected.

Like verify_root_map(), the check is about uid 0 of the joiner's own
namespace.  The root user of an ancestor that it maps at another uid,
and a root user stored through an idmapped mount, are left to whoever
set up that map or mount.

Fix by refusing setns() when the joiner doesn't have CAP_SETFCAP and
tasks in the namespace can write file capabilities for the root user of
the joiner's namespace.

Suggested-by: Serge Hallyn <serge@hallyn.com>
Link: https://lore.kernel.org/all/fd159e68-c613-4c7d-bfba-8af0a3f3a96e@hallyn.com/
Fixes: db2e718a4798 ("capabilities: require CAP_SETFCAP to map uid 0")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/capability.h |  3 +++
 kernel/user_namespace.c    |  4 ++++
 security/commoncap.c       | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/include/linux/capability.h b/include/linux/capability.h
index 622137f66f09..9ebcdab56937 100644
--- a/include/linux/capability.h
+++ b/include/linux/capability.h
@@ -34,6 +34,7 @@ struct cpu_vfs_cap_data {
 #define _USER_CAP_HEADER_SIZE  (sizeof(struct __user_cap_header_struct))
 #define _KERNEL_CAP_T_SIZE     (sizeof(kernel_cap_t))
 
+struct cred;
 struct file;
 struct inode;
 struct dentry;
@@ -222,4 +223,6 @@ int get_vfs_caps_from_disk(const struct mnt_idmap *idmap,
 int cap_convert_nscap(const struct mnt_idmap *idmap, struct dentry *dentry,
 		      const void **ivalue, size_t size);
 
+bool cred_borrows_setfcap(const struct cred *cred, struct user_namespace *ns);
+
 #endif /* !_LINUX_CAPABILITY_H */
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 50c374ed4687..34becacaccd6 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -1390,6 +1390,10 @@ static int userns_install(struct nsset *nsset, struct ns_common *ns)
 	if (!ns_capable(user_ns, CAP_SYS_ADMIN))
 		return -EPERM;
 
+	/* Don't hand back CAP_SETFCAP to a root task that gave it up. */
+	if (cred_borrows_setfcap(current_cred(), user_ns))
+		return -EPERM;
+
 	cred = nsset_cred(nsset);
 	if (!cred)
 		return -EINVAL;
diff --git a/security/commoncap.c b/security/commoncap.c
index d47ab3022343..96ac039fddad 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -131,6 +131,55 @@ int cap_capable(const struct cred *cred, struct user_namespace *target_ns,
 	return ret;
 }
 
+/*
+ * @ns has no uid_map yet.  Could @caller_root_kuid still be mapped into it,
+ * so that tasks in @ns get CAP_SETFCAP over it?  A writer in the parent can
+ * map any uid that the parent maps.  If that is uid 0 of the parent, a task
+ * in @ns can only map it if the creator of @ns had CAP_SETFCAP, a writer in
+ * the parent only if it has CAP_SETFCAP there, see verify_root_map().
+ */
+static inline bool userns_may_map_root(struct user_namespace *ns,
+				       kuid_t caller_root_kuid)
+{
+	uid_t caller_root_in_parent = from_kuid(ns->parent, caller_root_kuid);
+
+	if (caller_root_in_parent == (uid_t)-1)
+		return false;
+	return caller_root_in_parent != 0 || ns->parent_could_setfcap;
+}
+
+/**
+ * cred_borrows_setfcap - Check whether a userns gives back CAP_SETFCAP
+ * @cred: The credentials of a task that joins @ns or traces a task in it
+ * @ns: The user namespace
+ *
+ * A task without CAP_SETFCAP can't map uid 0 of its namespace into a user
+ * namespace it creates, see verify_root_map(), as tasks there could then
+ * write file capabilities that are honoured for that root user.  Tasks in
+ * @ns can do that if @ns maps it, at any uid, or if it can still be mapped
+ * into @ns, see userns_may_map_root().
+ *
+ * Like verify_root_map(), this only looks at uid 0 of @cred's namespace, not
+ * at the root users of ancestors that it maps at another uid, and a root
+ * user stored through an idmapped mount is up to whoever sets up the mount.
+ *
+ * Return: true if @cred doesn't have CAP_SETFCAP and tasks in @ns can write
+ * file capabilities for the root user of @cred's namespace.
+ */
+bool cred_borrows_setfcap(const struct cred *cred, struct user_namespace *ns)
+{
+	kuid_t caller_root_kuid = make_kuid(cred->user_ns, 0);
+
+	if (!uid_valid(caller_root_kuid) ||
+	    cap_raised(cred->cap_permitted, CAP_SETFCAP))
+		return false;
+
+	if (READ_ONCE(ns->uid_map.nr_extents))
+		return kuid_has_mapping(ns, caller_root_kuid);
+
+	return userns_may_map_root(ns, caller_root_kuid);
+}
+
 /**
  * cap_settime - Determine whether the current process may set the system clock
  * @ts: The time to set

-- 
2.55.0

